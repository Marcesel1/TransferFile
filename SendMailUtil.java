package REPLACE;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.zip.ZipOutputStream;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.mail.util.ByteArrayDataSource;

public class SendMailUtil {	
	
	

	// create message for link service
	public static ByteArrayOutputStream createMessage(String to, String subject, String body)
			throws MessagingException, IOException {

		Message message = new MimeMessage(Session.getInstance(System.getProperties()));
		try {
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(subject);
			message.setHeader("X-Unsent", "1");
			// create the message part
			MimeBodyPart content = new MimeBodyPart();
			// fill message
			content.setText(body, "utf-8", "html");
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(content);
			// integration
			message.setContent(multipart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		message.writeTo(outputStream);
		return outputStream;
	}

	// read for templateLink.html
	public static String readFile(ArrayList<String> fileNames, String fileDir, String desktopName, String repositoryId,
			String[] docIds, String[] templNames, String version, String server) {
		StringBuilder builder = new StringBuilder();
		String link = "";
		String line = "";
		try {
			BufferedReader reader = new BufferedReader(
					new InputStreamReader(SendMailUtil.class.getResourceAsStream(fileDir), "UTF-8"));
			String currentLine = reader.readLine();

			while (currentLine != null) {
				if (currentLine.indexOf("%LINKS%") >= 0) {
					for (int i = 0; i <= fileNames.size() - 1; i++) {
						link = server +"/bookmark.jsp?desktop=" + desktopName
								+ "&repositoryId=" + repositoryId + "&docid=" + docIds[i] + "&template_name="
								+ templNames[i] + "&version="+ version;
						line += "<li><a href=" + link + ">" + fileNames.get(i) + "</a></li>";
					}
					currentLine = currentLine.replaceAll("%LINKS%", line);
				}
				builder.append(currentLine);
				currentLine = reader.readLine();
			}
			reader.close();
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}

		return builder.toString();
	}
	
	
	public static void convertInputToOutputStream(InputStream inStream, ByteArrayOutputStream bos) {
		try {
			int nBytesRead = 0;
			for (byte[] nextBytes = new byte[8192]; nBytesRead != -1; nBytesRead = inStream.read(nextBytes))
				bos.write(nextBytes, 0, nBytesRead);
		} catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
}
