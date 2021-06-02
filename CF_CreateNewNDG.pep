<?xml version='1.0' encoding='UTF-8'?>
<!DOCTYPE WorkFlowDefinition SYSTEM "wfdef4.dtd">
<WorkFlowDefinition ApiVersion="4.0"
Origin="JavaAPI"
	Subject="&quot;New NDG Creation&quot;"
	Name="CF_CreateNewNDG"
	DisableEmailNotification="false"
	MainAttachment="&quot;Document&quot;"
	Tag="FoldersCreated"
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
		Name="Root_Folder"
		ValueExpr="&quot;Credit File||2|3|Digital Archive|{50254B78-0000-CE1E-9DDF-FA6E9EB34CCB}&quot;"
		Type="attachment"
		IsArray="false"
		MergeType="override"/>
	<Field
		Name="FolderNames"
		ValueExpr="{&quot;&quot;}"
		Type="string"
		IsArray="true"
		MergeType="override"/>
	<Field
		Name="New_Cust_Folder"
		ValueExpr="&quot;||0|0||&quot;"
		Type="attachment"
		IsArray="false"
		MergeType="override"/>
	<Field
		Name="PartnerFolderName"
		ValueExpr="&quot;&quot;"
		Type="string"
		IsArray="false"
		MergeType="override"/>
	<Field
		Name="CustomerName"
		ValueExpr="&quot;&quot;"
		Type="string"
		IsArray="false"
		MergeType="override"/>
	<Field
		Name="SubFolderNDGSearch"
		ValueExpr="&quot;Workflow Sub Node Search||3|3|Digital Archive|{A0936978-0000-C016-90BE-49F821575A71}|-1&quot;"
		Type="attachment"
		IsArray="false"
		MergeType="override"/>
	<Field
		Name="SubFolderDocTypes1"
		ValueExpr="{&quot;&quot;}"
		Type="string"
		IsArray="true"
		MergeType="override"/>
	<Field
		Name="SubFolders"
		ValueExpr="{&quot;||0|0||&quot;}"
		Type="attachment"
		IsArray="true"
		MergeType="AppendNoDup"/>
	<Field
		Name="SubFolderDocTypes2"
		ValueExpr="{&quot;&quot;}"
		Type="string"
		IsArray="true"
		MergeType="override"/>
	<Field
		Name="SubFolderDocTypes3"
		ValueExpr="{&quot;&quot;}"
		Type="string"
		IsArray="true"
		MergeType="override"/>
	<Field
		Name="SubFolderDocTypes4"
		ValueExpr="{&quot;&quot;}"
		Type="string"
		IsArray="true"
		MergeType="override"/>
	<Field
		Name="SubFolderDocTypes5"
		ValueExpr="{&quot;&quot;}"
		Type="string"
		IsArray="true"
		MergeType="override"/>
	<Field
		Name="SubFolderDocTypes6"
		ValueExpr="{&quot;&quot;}"
		Type="string"
		IsArray="true"
		MergeType="override"/>
	<Field
		Name="SubFolderDocTypes7"
		ValueExpr="{&quot;&quot;}"
		Type="string"
		IsArray="true"
		MergeType="override"/>
	<Field
		Name="SubFolderDocTypes8"
		ValueExpr="{&quot;&quot;}"
		Type="string"
		IsArray="true"
		MergeType="override"/>
	<Field
		Name="SubFolderDocTypes9"
		ValueExpr="{&quot;&quot;}"
		Type="string"
		IsArray="true"
		MergeType="override"/>
	<Field
		Name="SubFolderDocTypes10"
		ValueExpr="{&quot;&quot;}"
		Type="string"
		IsArray="true"
		MergeType="override"/>
	<Field
		Name="FoldersCreated"
		ValueExpr="false"
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
		Name="IsEVD"
		ValueExpr="false"
		Type="boolean"
		IsArray="false"
		MergeType="override"/>
	<Map
		Name="Workflow"
		MaxStepId="146" >
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
				Name="PartnerFolderName"
				ValueExpr="PartnerFolderName"
				Type="string"
				IsArray="false"
				Mode="inout"/>
			<Parameter
				Name="CustomerName"
				ValueExpr="CustomerName"
				Type="string"
				IsArray="false"
				Mode="inout"/>
			<Parameter
				Name="PartnerString"
				ValueExpr="PartnerString"
				Type="string"
				IsArray="false"
				Mode="inout"/>
			<Route
				SourceStepId="0"
				DestinationStepId="145"
				RouteId="77"
				Condition="IsEVD = true"/>
			<Route
				SourceStepId="0"
				DestinationStepId="143"
				RouteId="78"
				Condition="IsEVD = false"/>
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
			StepId="57"
			Name="Create new top folder"
			XCoordinate="467"
			YCoordinate="51"
			JoinType="or"
			SplitType="or">
			<Instruction
				Id="58"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="createFolder" />
				<Expression Val="Root_Folder" />
				<Expression Val="&quot;DDDCreditFileTopNode&quot;" />
				<Expression Val="{&quot;FolderName&quot;,&quot;STRING&quot;,PartnerFolderName,&quot;DDD_CustomerName&quot;,&quot;STRING&quot;,CustomerName,&quot;DDD_NDG&quot;,&quot;INTEGER&quot;,PartnerString}" />
				<Expression Val="New_Cust_Folder" />
			</Instruction>
			<Route
				SourceStepId="57"
				DestinationStepId="84"
				RouteId="61"/>
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
			StepId="66"
			Name="Create folder hierarchy"
			XCoordinate="900"
			YCoordinate="52"
			JoinType="or"
			SplitType="or">
			<Instruction
				Id="67"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="createFolder" />
				<Expression Val="New_Cust_Folder" />
				<Expression Val="&quot;DDDCreditFileSubNodes&quot;" />
				<Expression Val="{&quot;FolderName&quot;,&quot;STRING&quot;,FolderNames[1],&quot;DDD_NDG&quot;,&quot;INTEGER&quot;,PartnerString}" />
				<Expression Val="SubFolders[1]" />
			</Instruction>
			<Instruction
				Id="68"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="createFolder" />
				<Expression Val="New_Cust_Folder" />
				<Expression Val="&quot;DDDCreditFileSubNodes&quot;" />
				<Expression Val="{&quot;FolderName&quot;,&quot;STRING&quot;,FolderNames[2],&quot;DDD_NDG&quot;,&quot;INTEGER&quot;,PartnerString}" />
				<Expression Val="SubFolders[2]" />
			</Instruction>
			<Instruction
				Id="75"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="createFolder" />
				<Expression Val="New_Cust_Folder" />
				<Expression Val="&quot;DDDCreditFileSubNodes&quot;" />
				<Expression Val="{&quot;FolderName&quot;,&quot;STRING&quot;,FolderNames[3],&quot;DDD_NDG&quot;,&quot;INTEGER&quot;,PartnerString}" />
				<Expression Val="SubFolders[3]" />
			</Instruction>
			<Instruction
				Id="76"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="createFolder" />
				<Expression Val="New_Cust_Folder" />
				<Expression Val="&quot;DDDCreditFileSubNodes&quot;" />
				<Expression Val="{&quot;FolderName&quot;,&quot;STRING&quot;,FolderNames[4],&quot;DDD_NDG&quot;,&quot;INTEGER&quot;,PartnerString}" />
				<Expression Val="SubFolders[4]" />
			</Instruction>
			<Instruction
				Id="77"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="createFolder" />
				<Expression Val="New_Cust_Folder" />
				<Expression Val="&quot;DDDCreditFileSubNodes&quot;" />
				<Expression Val="{&quot;FolderName&quot;,&quot;STRING&quot;,FolderNames[5],&quot;DDD_NDG&quot;,&quot;INTEGER&quot;,PartnerString}" />
				<Expression Val="SubFolders[5]" />
			</Instruction>
			<Instruction
				Id="78"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="createFolder" />
				<Expression Val="New_Cust_Folder" />
				<Expression Val="&quot;DDDCreditFileSubNodes&quot;" />
				<Expression Val="{&quot;FolderName&quot;,&quot;STRING&quot;,FolderNames[6],&quot;DDD_NDG&quot;,&quot;INTEGER&quot;,PartnerString}" />
				<Expression Val="SubFolders[6]" />
			</Instruction>
			<Instruction
				Id="79"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="createFolder" />
				<Expression Val="New_Cust_Folder" />
				<Expression Val="&quot;DDDCreditFileSubNodes&quot;" />
				<Expression Val="{&quot;FolderName&quot;,&quot;STRING&quot;,FolderNames[7],&quot;DDD_NDG&quot;,&quot;INTEGER&quot;,PartnerString}" />
				<Expression Val="SubFolders[7]" />
			</Instruction>
			<Instruction
				Id="80"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="createFolder" />
				<Expression Val="New_Cust_Folder" />
				<Expression Val="&quot;DDDCreditFileSubNodes&quot;" />
				<Expression Val="{&quot;FolderName&quot;,&quot;STRING&quot;,FolderNames[8],&quot;DDD_NDG&quot;,&quot;INTEGER&quot;,PartnerString}" />
				<Expression Val="SubFolders[8]" />
			</Instruction>
			<Instruction
				Id="81"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="createFolder" />
				<Expression Val="New_Cust_Folder" />
				<Expression Val="&quot;DDDCreditFileSubNodes&quot;" />
				<Expression Val="{&quot;FolderName&quot;,&quot;STRING&quot;,FolderNames[9],&quot;DDD_NDG&quot;,&quot;INTEGER&quot;,PartnerString}" />
				<Expression Val="SubFolders[9]" />
			</Instruction>
			<Instruction
				Id="82"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="createFolder" />
				<Expression Val="New_Cust_Folder" />
				<Expression Val="&quot;DDDCreditFileSubNodes&quot;" />
				<Expression Val="{&quot;FolderName&quot;,&quot;STRING&quot;,FolderNames[10],&quot;DDD_NDG&quot;,&quot;INTEGER&quot;,PartnerString}" />
				<Expression Val="SubFolders[10]" />
			</Instruction>
			<Route
				SourceStepId="66"
				DestinationStepId="93"
				RouteId="64"/>
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
			StepId="84"
			Name="Search Sample Folder"
			XCoordinate="619"
			YCoordinate="51"
			JoinType="or"
			SplitType="or">
			<Instruction
				Id="85"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="searchForMany" />
				<Expression Val="SubFolderNDGSearch" />
				<Expression Val="&quot;folder&quot;" />
				<Expression Val="{4}" />
				<Expression Val="{&quot;999999&quot;}" />
				<Expression Val="Partner_Folder" />
			</Instruction>
			<Route
				SourceStepId="84"
				DestinationStepId="87"
				RouteId="62"/>
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
			StepId="87"
			Name="Get sample Doc Types"
			XCoordinate="754"
			YCoordinate="51"
			JoinType="or"
			SplitType="or">
			<Instruction
				Id="91"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="getMultiStringProperty" />
				<Expression Val="Partner_Folder[1]" />
				<Expression Val="&quot;DDD_AssociatedDocumentTypes&quot;" />
				<Expression Val="SubFolderDocTypes1" />
			</Instruction>
			<Instruction
				Id="95"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="getMultiStringProperty" />
				<Expression Val="Partner_Folder[2]" />
				<Expression Val="&quot;DDD_AssociatedDocumentTypes&quot;" />
				<Expression Val="SubFolderDocTypes2" />
			</Instruction>
			<Instruction
				Id="96"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="getMultiStringProperty" />
				<Expression Val="Partner_Folder[3]" />
				<Expression Val="&quot;DDD_AssociatedDocumentTypes&quot;" />
				<Expression Val="SubFolderDocTypes3" />
			</Instruction>
			<Instruction
				Id="97"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="getMultiStringProperty" />
				<Expression Val="Partner_Folder[4]" />
				<Expression Val="&quot;DDD_AssociatedDocumentTypes&quot;" />
				<Expression Val="SubFolderDocTypes4" />
			</Instruction>
			<Instruction
				Id="98"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="getMultiStringProperty" />
				<Expression Val="Partner_Folder[5]" />
				<Expression Val="&quot;DDD_AssociatedDocumentTypes&quot;" />
				<Expression Val="SubFolderDocTypes5" />
			</Instruction>
			<Instruction
				Id="99"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="getMultiStringProperty" />
				<Expression Val="Partner_Folder[6]" />
				<Expression Val="&quot;DDD_AssociatedDocumentTypes&quot;" />
				<Expression Val="SubFolderDocTypes6" />
			</Instruction>
			<Instruction
				Id="100"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="getMultiStringProperty" />
				<Expression Val="Partner_Folder[7]" />
				<Expression Val="&quot;DDD_AssociatedDocumentTypes&quot;" />
				<Expression Val="SubFolderDocTypes7" />
			</Instruction>
			<Instruction
				Id="101"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="getMultiStringProperty" />
				<Expression Val="Partner_Folder[8]" />
				<Expression Val="&quot;DDD_AssociatedDocumentTypes&quot;" />
				<Expression Val="SubFolderDocTypes8" />
			</Instruction>
			<Instruction
				Id="102"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="getMultiStringProperty" />
				<Expression Val="Partner_Folder[9]" />
				<Expression Val="&quot;DDD_AssociatedDocumentTypes&quot;" />
				<Expression Val="SubFolderDocTypes9" />
			</Instruction>
			<Instruction
				Id="103"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="getMultiStringProperty" />
				<Expression Val="Partner_Folder[10]" />
				<Expression Val="&quot;DDD_AssociatedDocumentTypes&quot;" />
				<Expression Val="SubFolderDocTypes10" />
			</Instruction>
			<Route
				SourceStepId="87"
				DestinationStepId="66"
				RouteId="63"/>
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
			StepId="93"
			Name="Set doc types"
			XCoordinate="1024"
			YCoordinate="51"
			JoinType="or"
			SplitType="or">
			<Instruction
				Id="94"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="setMultiStringProperty" />
				<Expression Val="SubFolders[1]" />
				<Expression Val="&quot;DDD_AssociatedDocumentTypes&quot;" />
				<Expression Val="SubFolderDocTypes1" />
			</Instruction>
			<Instruction
				Id="104"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="setMultiStringProperty" />
				<Expression Val="SubFolders[2]" />
				<Expression Val="&quot;DDD_AssociatedDocumentTypes&quot;" />
				<Expression Val="SubFolderDocTypes2" />
			</Instruction>
			<Instruction
				Id="105"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="setMultiStringProperty" />
				<Expression Val="SubFolders[3]" />
				<Expression Val="&quot;DDD_AssociatedDocumentTypes&quot;" />
				<Expression Val="SubFolderDocTypes3" />
			</Instruction>
			<Instruction
				Id="106"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="setMultiStringProperty" />
				<Expression Val="SubFolders[4]" />
				<Expression Val="&quot;DDD_AssociatedDocumentTypes&quot;" />
				<Expression Val="SubFolderDocTypes4" />
			</Instruction>
			<Instruction
				Id="107"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="setMultiStringProperty" />
				<Expression Val="SubFolders[5]" />
				<Expression Val="&quot;DDD_AssociatedDocumentTypes&quot;" />
				<Expression Val="SubFolderDocTypes5" />
			</Instruction>
			<Instruction
				Id="108"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="setMultiStringProperty" />
				<Expression Val="SubFolders[6]" />
				<Expression Val="&quot;DDD_AssociatedDocumentTypes&quot;" />
				<Expression Val="SubFolderDocTypes6" />
			</Instruction>
			<Instruction
				Id="109"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="setMultiStringProperty" />
				<Expression Val="SubFolders[7]" />
				<Expression Val="&quot;DDD_AssociatedDocumentTypes&quot;" />
				<Expression Val="SubFolderDocTypes7" />
			</Instruction>
			<Instruction
				Id="110"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="setMultiStringProperty" />
				<Expression Val="SubFolders[8]" />
				<Expression Val="&quot;DDD_AssociatedDocumentTypes&quot;" />
				<Expression Val="SubFolderDocTypes8" />
			</Instruction>
			<Instruction
				Id="111"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="setMultiStringProperty" />
				<Expression Val="SubFolders[9]" />
				<Expression Val="&quot;DDD_AssociatedDocumentTypes&quot;" />
				<Expression Val="SubFolderDocTypes9" />
			</Instruction>
			<Instruction
				Id="112"
				Action="execute">
				<Expression Val="CE_Operations" />
				<Expression Val="setMultiStringProperty" />
				<Expression Val="SubFolders[10]" />
				<Expression Val="&quot;DDD_AssociatedDocumentTypes&quot;" />
				<Expression Val="SubFolderDocTypes10" />
			</Instruction>
			<Route
				SourceStepId="93"
				DestinationStepId="123"
				RouteId="71"/>
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
			StepId="123"
			Name="Folders Created"
			XCoordinate="1131"
			YCoordinate="51"
			JoinType="or"
			SplitType="or">
			<Instruction
				Id="124"
				Action="assign">
				<Expression Val="FoldersCreated" />
				<Expression Val="true" />
			</Instruction>
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
			StepId="141"
			Name="Assign folder values"
			XCoordinate="318"
			YCoordinate="51"
			JoinType="or"
			SplitType="or">
			<Instruction
				Id="142"
				Action="assign">
				<Expression Val="FolderNames" />
				<Expression Val="{&quot;Ausweis der Kreditverhältnisse&quot;,&quot;Kreditvereinbarungen extern&quot;,&quot;Avale&quot;,&quot;Beurteilungsunterlagen&quot;,&quot;Sicherheiten&quot;,&quot;Auszüge, Auskünfte&quot;,&quot;Allgemeiner Schriftverkehr&quot;,&quot;Original Bonitätsunterlagen&quot;,&quot;Objektunterlagen&quot;,&quot;Zwangsmaßnahmen&quot;}" />
				<Expression Val="PartnerFolderName" />
				<Expression Val="IsEVDVal + &quot; - &quot; + PartnerString + &quot; - &quot; + CustomerName" />
			</Instruction>
			<Route
				SourceStepId="141"
				DestinationStepId="57"
				RouteId="76"/>
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
			StepId="143"
			Name="Set Partner"
			XCoordinate="207"
			YCoordinate="153"
			JoinType="or"
			SplitType="or">
			<Instruction
				Id="144"
				Action="assign">
				<Expression Val="IsEVDVal" />
				<Expression Val="&quot;PAR&quot;" />
			</Instruction>
			<Route
				SourceStepId="143"
				DestinationStepId="141"
				RouteId="74"/>
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
			StepId="145"
			Name="Set EVD"
			XCoordinate="210"
			YCoordinate="50"
			JoinType="or"
			SplitType="or">
			<Instruction
				Id="146"
				Action="assign">
				<Expression Val="IsEVDVal" />
				<Expression Val="&quot;EVD&quot;" />
			</Instruction>
			<Route
				SourceStepId="145"
				DestinationStepId="141"
				RouteId="75"/>
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
	</Map>
</WorkFlowDefinition>
