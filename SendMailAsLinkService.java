package REPLACE;

import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.security.auth.Subject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.filenet.api.collection.ContentElementList;
import com.filenet.api.core.ContentTransfer;
import com.filenet.api.core.Document;
import com.filenet.api.core.Factory;
import com.filenet.api.core.ObjectStore;
import com.filenet.api.util.Id;
import com.filenet.api.util.UserContext;
import com.ibm.ecm.extension.PluginService;
import com.ibm.ecm.extension.PluginServiceCallbacks;

import REPLACE;

/**
 * Provides an abstract class that is extended to create a class implementing
 * each service provided by the plug-in. Services are actions, similar to
 * servlets or Struts actions, that perform operations on the IBM Content
 * Navigator server. A service can access content server application programming
 * interfaces (APIs) and Java EE APIs.
 * <p>
 * Services are invoked from the JavaScript functions that are defined for the
 * plug-in by using the <code>ecm.model.Request.invokePluginService</code>
 * function.
 * </p>
 * Follow best practices for servlets when implementing an IBM Content Navigator
 * plug-in service. In particular, always assume multi-threaded use and do not
 * keep unshared information in instance variables.
 */
public class SendMailAsLinkService extends PluginService {
	
	private static final Logger log = LoggingUtil.getLogger(SendMailAsLinkService.class);
	/**
	 * Returns the unique identifier for this service.
	 * <p>
	 * <strong>Important:</strong> This identifier is used in URLs so it must
	 * contain only alphanumeric characters.
	 * </p>
	 * 
	 * @return A <code>String</code> that is used to identify the service.
	 */
	public String getId() {
		return "SendMailAsLinkService";
	}

	/**
	 * Returns the name of the IBM Content Navigator service that this service
	 * overrides. If this service does not override an IBM Content Navigator
	 * service, this method returns <code>null</code>.
	 * 
	 * @returns The name of the service.
	 */
	public String getOverriddenService() {
		return null;
	}

	/**
	 * Performs the action of this service.
	 * 
	 * @param callbacks An instance of the <code>PluginServiceCallbacks</code> class
	 *                  that contains several functions that can be used by the
	 *                  service. These functions provide access to the plug-in
	 *                  configuration and content server APIs.
	 * @param request   The <code>HttpServletRequest</code> object that provides the
	 *                  request. The service can access the invocation parameters
	 *                  from the request.
	 * @param response  The <code>HttpServletResponse</code> object that is
	 *                  generated by the service. The service can get the output
	 *                  stream and write the response. The response must be in JSON
	 *                  format.
	 * @throws Exception For exceptions that occur when the service is running. If
	 *                   the logging level is high enough to log errors, information
	 *                   about the exception is logged by IBM Content Navigator.
	 */
	public void execute(PluginServiceCallbacks callbacks, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String repositoryId = request.getParameter("repId").toString();
		String version = request.getParameter("version").toString();
		String[] docIds = request.getParameterValues("docIds");
		String[] templNames = request.getParameterValues("templNames");
		String[] docNames = request.getParameterValues("docNames");
		String fileName = "";
		ArrayList<String> fileNames = new ArrayList<String>();
		String desktopName = request.getParameter("desktopName").toString();

		//Construct host URL
		String uri = request.getRequestURI();
		//uri = "/context/someAction"
		String url = request.getRequestURL().toString();
		// url = "http://server.name:9080/context/someAction"
		String ctxPath = request.getContextPath();
		// ctxPath = "/context";
		url = url.replaceFirst(uri, "");
		// url = "http://server.name:9080"
		url = url + ctxPath;
		//url = "http://server.name:9080/context"
        //System.out.println("Host adress:" + url);
		
		
		// Indicate that a file is being sent back
		response.setContentType("message/rfc822");
		response.setHeader("Content-Disposition", "attachment;filename=message.eml");
		//System.out.println("Pocet oznacenych suborov je :" + docIds.length);
        callbacks.getLogger().logEntry(this, repositoryId, request);
        log.info("SendMailAsLinkService started.");
        
		// Authentication and connection
		Subject subject = callbacks.getP8Subject(repositoryId);
		UserContext.get().pushSubject(subject);
		try {
			// Retrieve the objectstore
			ObjectStore os = callbacks.getP8ObjectStore(repositoryId);

			// Get the first content element of selected documents
			for (int i = 0; i <= docIds.length - 1; i++) {
			//	System.out.println("Working with file id: " + docIds[i]);
				// Retrieve the document
				Document doc = Factory.Document.fetchInstance(os, new Id(docIds[i]), null);
				// Grab the first content element
				ContentElementList elements = doc.get_ContentElements();
				fileName = docNames[i];
				ContentTransfer cT = (ContentTransfer) elements.get(0);
				if (cT != null) {
					String docType = cT.get_RetrievalName();
					// Customize the filename
					if (fileName.contains(".")) {
						int pos = fileName.lastIndexOf(".");
						fileName = fileName.substring(0, pos);
					}
					fileName = fileName.replaceAll("[\\\\/:*?\"<>|]", "");
					fileName += docType.substring(docType.lastIndexOf("."));
					fileNames.add(fileName);
					log.info(fileName + " added as link to eml.");
				}

			}
			// Generate .eml file
			String emailBody = SendMailUtil.readFile(fileNames, "/templateLink.html", desktopName, repositoryId, docIds, templNames, version, url);
			ByteArrayOutputStream emlBaos = SendMailUtil.createMessage("", "Subject", emailBody);
			OutputStream stream = response.getOutputStream();
			stream.write(emlBaos.toByteArray());
			stream.flush();
			log.info("SendMailAsLinkService finished.");
			stream.close();
		} catch (Exception e) {
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            callbacks.getLogger().logError(this, fileName, request, e);
            log.error("SendMailAsLinkService error...", e);
		} finally {
			UserContext.get().popSubject();
		}
	}
}
