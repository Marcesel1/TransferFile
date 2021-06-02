<?xml version='1.0' encoding='UTF-8'?>
<!DOCTYPE WorkFlowDefinition SYSTEM "wfdef4.dtd">
<WorkFlowDefinition ApiVersion="4.0"
Origin="JavaAPI"
	Subject="&quot;Copy Document&quot;"
	Description=""
	Name="CF_CopyDocument2"
	DisableEmailNotification="false"
	MainAttachment="&quot;Document&quot;"
	AuthorTool="Process Designer"
	OtherAuthorTools=""
	versionAgnostic="false"
	validateUsingSchema="true"
	validateFlag="true"
	transferFlag="true">
	<Field
		Name="Document"
		ValueExpr="&quot;||0|0||&quot;"
		Type="attachment"
		IsArray="false"
		MergeType="override"/>
	<Field
		Name="Partner_Search"
		ValueExpr="&quot;Workflow Top Node Search||3|3|Digital Archive|{A0926978-0000-CF1B-86EC-AC7CB14A5FE1}|-1&quot;"
		Type="attachment"
		IsArray="false"
		MergeType="override"/>
	<Field
		Name="Partner_Folder"
		ValueExpr="{&quot;||0|0||&quot;}"
		Type="attachment"
		IsArray="true"
		MergeType="AppendNoDup"/>
	<Field
		Name="PartnerString"
		ValueExpr="&quot;&quot;"
		Type="string"
		IsArray="false"
		MergeType="override"/>
	<Field
		Name="FolderNames"
		ValueExpr="{&quot;&quot;}"
		Type="string"
		IsArray="true"
		MergeType="override"/>
	<Field
		Name="PartnerFolderName"
		ValueExpr="&quot;&quot;"
		Type="string"
		IsArray="false"
		MergeType="override"/>
	<Field
		Name="NDGNumber"
		ValueExpr="0"
		Type="int"
		IsArray="false"
		MergeType="override"/>
	<Field
		Name="PartnerName"
		ValueExpr="&quot;&quot;"
		Type="string"
		IsArray="false"
		MergeType="override"/>
	<Field
		Name="AssosDoctyp"
		ValueExpr="&quot;&quot;"
		Type="string"
		IsArray="false"
		MergeType="override"/>
	<Field
		Name="IsEVD"
		ValueExpr="true"
		Type="boolean"
		IsArray="false"
		MergeType="override"/>
	<Field
		Name="IsEVDVal"
		ValueExpr="&quot;&quot;"
		Type="string"
		IsArray="false"
		MergeType="override"/>
	<Field
		Name="FolderHierarchyCreated"
		ValueExpr="true"
		Type="boolean"
		IsArray="false"
		MergeType="override"/>
	<Field
		Name="ConditionResult"
		ValueExpr="0"
		Type="int"
		IsArray="false"
		MergeType="override"/>
	<Field
		Name="DestinationFolder"
		ValueExpr="{&quot;||0|0||&quot;}"
		Type="attachment"
		IsArray="true"
		MergeType="AppendNoDup"/>
	<Field
		Name="SearchSubFolderSubNode"
		ValueExpr="&quot;Workflow Sub Nodes Complex Search||3|3|Digital Archive|{90A16978-0000-C91E-8F47-76EDC1F89C85}|-1&quot;"
		Type="attachment"
		IsArray="false"
		MergeType="override"/>
	<Field
		Name="CopiedDocument"
		ValueExpr="&quot;||0|0||&quot;"
		Type="attachment"
		IsArray="false"
		MergeType="override"/>
	<Map
		Name="Workflow"
		MapId="-2"
		MaxStepId="165" >
		<Step
			StepId="0"
			Name="LaunchStep"
			XCoordinate="49"
			YCoordinate="49"
			RequestedInterface="Navigator Launch Processor (default)"
			JoinType="none"
			SplitType="or"
			CanReassign="true"
			CanViewStatus="true"
			CanViewHistory="false"
			IgnoreInvalidUsers="false">
			<Parameter
				Name="Document"
				ValueExpr="Document"
				Type="attachment"
				IsArray="false"
				Mode="inout"/>
			<Parameter
				Name="NDGNumber"
				ValueExpr="NDGNumber"
				Type="int"
				IsArray="false"
				Mode="inout"/>
			<Parameter
				Name="AssosDoctyp"
				ValueExpr="AssosDoctyp"
				Type="string"
				IsArray="false"
				Mode="inout"/>
			<Route
				SourceStepId="0"
				DestinationStepId="156"
				RouteId="86"
				Condition="NDGNumber = 0 or len(AssosDoctyp) = 0"/>
			<Route
				SourceStepId="0"
				DestinationStepId="60"
				RouteId="91"
				Condition="NDGNumber &gt; 0 and len(AssosDoctyp) &gt; 0"/>
			<ModelAttributes>
				<ModelAttribute
					Name="UI_StepType"
					Type="int"
					IsArray="false">
						<Value Val="1"/>
				</ModelAttribute>
			</ModelAttributes>
		</Step>
		<CompoundStep
			StepId="7"
			Name="Search Partner Folder"
			XCoordinate="436"
			YCoordinate="48"
			JoinType="or"
			SplitType="or">
			<Instruction
				Id="55"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="searchForMany" />
				<Expression Val="Partner_Search" />
				<Expression Val="&quot;folder&quot;" />
				<Expression Val="{4}" />
				<Expression Val="{PartnerString}" />
				<Expression Val="Partner_Folder" />
			</Instruction>
			<Route
				SourceStepId="7"
				DestinationStepId="129"
				RouteId="70"
				Condition="elementcount(Partner_Folder) = 0"/>
			<Route
				SourceStepId="7"
				DestinationStepId="162"
				RouteId="89"
				Condition="elementcount(Partner_Folder) &gt; 0"/>
			<ModelAttributes>
				<ModelAttribute
					Name="UI_StepType"
					Type="int"
					IsArray="false">
						<Value Val="8"/>
				</ModelAttribute>
			</ModelAttributes>
		</CompoundStep>
		<CompoundStep
			StepId="60"
			Name="Assigns"
			XCoordinate="272"
			YCoordinate="47"
			JoinType="or"
			SplitType="or">
			<Instruction
				Id="5"
				Action="assign">
				<Expression Val="PartnerString" />
				<Expression Val="numbertostring(NDGNumber)" />
			</Instruction>
			<Route
				SourceStepId="60"
				DestinationStepId="7"
				RouteId="46"/>
			<ModelAttributes>
				<ModelAttribute
					Name="UI_IconName"
					Type="string"
					IsArray="false">
						<Value Val="filenet/vw/toolkit/utils/images/assign_step"/>
				</ModelAttribute>
				<ModelAttribute
					Name="UI_StepType"
					Type="int"
					IsArray="false">
						<Value Val="6"/>
				</ModelAttribute>
				<ModelAttribute
					Name="UI_StartIconName"
					Type="string"
					IsArray="false">
						<Value Val="filenet/vw/toolkit/utils/images/start_assign_step"/>
				</ModelAttribute>
				<ModelAttribute
					Name="UI_StepPropertiesPanelClass"
					Type="string"
					IsArray="false">
						<Value Val="filenet.vw.toolkit.design.property.steps.systeminstructions.VWAssignPropertiesPanel"/>
				</ModelAttribute>
			</ModelAttributes>
		</CompoundStep>
		<CompoundStep
			StepId="129"
			Name="Create New NDG WF"
			XCoordinate="552"
			YCoordinate="158"
			JoinType="or"
			SplitType="or">
			<Instruction
				Id="130"
				Action="create">
				<Expression Val="CF_CreateNewNDG" />
				<Expression Val="Document" />
				<Expression Val="Document" />
				<Expression Val="PartnerString" />
				<Expression Val="PartnerString" />
				<Expression Val="CustomerName" />
				<Expression Val="PartnerName" />
				<Expression Val="IsEVD" />
				<Expression Val="IsEVD" />
			</Instruction>
			<Route
				SourceStepId="129"
				DestinationStepId="151"
				RouteId="81"/>
			<ModelAttributes>
				<ModelAttribute
					Name="UI_IconName"
					Type="string"
					IsArray="false">
						<Value Val="filenet/vw/toolkit/utils/images/create_wflo_step"/>
				</ModelAttribute>
				<ModelAttribute
					Name="UI_StepType"
					Type="int"
					IsArray="false">
						<Value Val="6"/>
				</ModelAttribute>
				<ModelAttribute
					Name="UI_StartIconName"
					Type="string"
					IsArray="false">
						<Value Val="filenet/vw/toolkit/utils/images/start_create_wflo_step"/>
				</ModelAttribute>
				<ModelAttribute
					Name="UI_StepPropertiesPanelClass"
					Type="string"
					IsArray="false">
						<Value Val="filenet.vw.toolkit.design.property.steps.systeminstructions.VWCreateWfloPropertiesPanel"/>
				</ModelAttribute>
			</ModelAttributes>
		</CompoundStep>
		<CompoundStep
			StepId="145"
			Name="Search Partner SubFolder"
			XCoordinate="873"
			YCoordinate="50"
			JoinType="or"
			SplitType="or">
			<Instruction
				Id="146"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="searchForMany" />
				<Expression Val="SearchSubFolderSubNode" />
				<Expression Val="&quot;folder&quot;" />
				<Expression Val="{4,5}" />
				<Expression Val="{AssosDoctyp,PartnerString}" />
				<Expression Val="DestinationFolder" />
			</Instruction>
			<Route
				SourceStepId="145"
				DestinationStepId="148"
				RouteId="77"
				Condition="elementcount(DestinationFolder) &gt; 0"/>
			<Route
				SourceStepId="145"
				DestinationStepId="147"
				RouteId="78"
				Condition="elementcount(DestinationFolder) = 0"/>
			<ModelAttributes>
				<ModelAttribute
					Name="UI_StepType"
					Type="int"
					IsArray="false">
						<Value Val="8"/>
				</ModelAttribute>
			</ModelAttributes>
		</CompoundStep>
		<Step
			StepId="147"
			Name="Check "
			XCoordinate="1192"
			YCoordinate="160"
			RequestedInterface="Navigator Step Processor (default)"
			QueueName="Inbox"
			JoinType="or"
			SplitType="or"
			CanReassign="true"
			CanViewStatus="true"
			CanViewHistory="false"
			IgnoreInvalidUsers="false">
			<Participant Val="F_Originator" />
			<Parameter
				Name="Document"
				ValueExpr="Document"
				Type="attachment"
				IsArray="false"
				Mode="inout"/>
			<Parameter
				Name="PartnerString"
				ValueExpr="PartnerString"
				Type="string"
				IsArray="false"
				Mode="inout"/>
			<Parameter
				Name="AssosDoctyp"
				ValueExpr="AssosDoctyp"
				Type="string"
				IsArray="false"
				Mode="inout"/>
			<ModelAttributes>
				<ModelAttribute
					Name="UI_StepType"
					Type="int"
					IsArray="false">
						<Value Val="2"/>
				</ModelAttribute>
			</ModelAttributes>
		</Step>
		<CompoundStep
			StepId="148"
			Name="file Document 2 Partner Folder"
			XCoordinate="1192"
			YCoordinate="49"
			JoinType="or"
			SplitType="or">
			<Instruction
				Id="165"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="copy" />
				<Expression Val="Document" />
				<Expression Val="false" />
				<Expression Val="CopiedDocument" />
			</Instruction>
			<Instruction
				Id="149"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="move" />
				<Expression Val="DestinationFolder[1]" />
				<Expression Val="CopiedDocument" />
			</Instruction>
			<ModelAttributes>
				<ModelAttribute
					Name="UI_StepType"
					Type="int"
					IsArray="false">
						<Value Val="8"/>
				</ModelAttribute>
			</ModelAttributes>
		</CompoundStep>
		<CompoundStep
			StepId="151"
			Name="Wait For Creation"
			XCoordinate="688"
			YCoordinate="158"
			JoinType="or"
			SplitType="or">
			<WFEInstruction
				Id="152"
				Action="wait_for_event"
				TimeOut="addminutes(systemtime(),5)"
				EventNumLoc="ConditionResult">
				<Event
					WCName="CF_CreateNewNDG"
					Operator="="
					Value="FolderHierarchyCreated">
				</Event>
			</WFEInstruction>
			<Route
				SourceStepId="151"
				DestinationStepId="162"
				RouteId="88"/>
			<ModelAttributes>
				<ModelAttribute
					Name="UI_IconName"
					Type="string"
					IsArray="false">
						<Value Val="filenet/vw/toolkit/utils/images/wait_for_condition_step"/>
				</ModelAttribute>
				<ModelAttribute
					Name="UI_StepType"
					Type="int"
					IsArray="false">
						<Value Val="6"/>
				</ModelAttribute>
				<ModelAttribute
					Name="UI_StartIconName"
					Type="string"
					IsArray="false">
						<Value Val="filenet/vw/toolkit/utils/images/start_wait_for_condition_step"/>
				</ModelAttribute>
				<ModelAttribute
					Name="UI_StepPropertiesPanelClass"
					Type="string"
					IsArray="false">
						<Value Val="filenet.vw.toolkit.design.property.steps.systeminstructions.VWWaitForConditionPropertiesPanel"/>
				</ModelAttribute>
			</ModelAttributes>
		</CompoundStep>
		<CompoundStep
			StepId="156"
			Name="Get init Doc values"
			XCoordinate="163"
			YCoordinate="156"
			JoinType="or"
			SplitType="or">
			<Instruction
				Id="157"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="getStringProperty" />
				<Expression Val="Document" />
				<Expression Val="&quot;DDD_CustomerName&quot;" />
				<Expression Val="PartnerName" />
			</Instruction>
			<Instruction
				Id="158"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="getIntegerProperty" />
				<Expression Val="Document" />
				<Expression Val="&quot;DDD_NDG&quot;" />
				<Expression Val="NDGNumber" />
			</Instruction>
			<Instruction
				Id="159"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="getStringProperty" />
				<Expression Val="Document" />
				<Expression Val="&quot;DDD_DocumentType&quot;" />
				<Expression Val="AssosDoctyp" />
			</Instruction>
			<Instruction
				Id="160"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="getBooleanProperty" />
				<Expression Val="Document" />
				<Expression Val="&quot;DDD_IsEVD&quot;" />
				<Expression Val="IsEVD" />
			</Instruction>
			<Route
				SourceStepId="156"
				DestinationStepId="60"
				RouteId="92"/>
			<ModelAttributes>
				<ModelAttribute
					Name="UI_StepType"
					Type="int"
					IsArray="false">
						<Value Val="8"/>
				</ModelAttribute>
			</ModelAttributes>
		</CompoundStep>
		<CompoundStep
			StepId="162"
			Name="Set doc props"
			XCoordinate="745"
			YCoordinate="49"
			JoinType="or"
			SplitType="or">
			<Instruction
				Id="163"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="setIntegerProperty" />
				<Expression Val="Document" />
				<Expression Val="&quot;DDD_NDG&quot;" />
				<Expression Val="NDGNumber" />
			</Instruction>
			<Instruction
				Id="164"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="setStringProperty" />
				<Expression Val="Document" />
				<Expression Val="&quot;DDD_DocumentType&quot;" />
				<Expression Val="AssosDoctyp" />
			</Instruction>
			<Route
				SourceStepId="162"
				DestinationStepId="145"
				RouteId="90"/>
			<ModelAttributes>
				<ModelAttribute
					Name="UI_StepType"
					Type="int"
					IsArray="false">
						<Value Val="8"/>
				</ModelAttribute>
			</ModelAttributes>
		</CompoundStep>
	</Map>
</WorkFlowDefinition>
