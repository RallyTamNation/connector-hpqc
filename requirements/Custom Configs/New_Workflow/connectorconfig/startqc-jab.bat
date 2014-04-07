chdir "C:\Program Files\RallyConnectorforQualityCenter_Requirements"
Start WinTail.exe "rallylog.log"
Start rally2_qc_connector.exe ".\Custom Configs\New_Workflow\connectorconfig\qc_req_config_julie062612.xml" ."\Custom Configs\New_Workflow\connectorconfig\qc_def_config_julie062612.xml" 2
Exit

