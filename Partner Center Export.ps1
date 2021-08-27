# Check if the MSOnline PowerShell module has already been loaded.
if ( ! ( Get-Module MSOnline) ) {
    # Check if the MSOnline PowerShell module is installed.
    if ( Get-Module -ListAvailable -Name MSOnline ) {
        Write-Host -ForegroundColor Green "Loading the MSOnline PowerShell module..."
        Import-Module MsOnline
    } else {
        Install-Module MsOnline
    }
}


Connect-MsolService
$path = echo ([Environment]::GetFolderPath("Desktop")+"\MsSubscriptions")
New-Item -ItemType Directory -Force -Path $path
$customerList = echo ([Environment]::GetFolderPath("Desktop")+"\MsSubscriptions\MSCustomerList.csv")
$clients = (Get-MsolPartnerContract)



$OfferIdMap = @{

"4B585984-651B-448A-9E53-3B10F069CF7F" = "6fbad345-b7de-42a6-b6ab-79b363d0b371"
"A4585165-0533-458A-97E3-C400570268C4" = "8c484fd0-1f3f-44fb-b6d2-26ca107273f6"
"84D5F90F-CD0D-4864-B90B-1C7BA63B4808" = "5d8c82e0-4386-4129-8b3b-5b5c193d1138"
"CDD28E44-67E3-425E-BE4C-737FAB2899D3" = "5c9fd4cc-edce-44a8-8e91-07df09744609"
"C52EA49F-FE5D-4E95-93BA-1DE91D380F89" = "648bf77b-1f0a-4911-8066-caf37d67dc72"
"EE02FD1B-340E-4A4B-B355-4A514E4C8943" = "2828be95-46ba-4f91-b2fd-0bef192ecf60"
"1FC08A02-8B3D-43B9-831E-F76859E04E1A" = "ff7a4f5b-4973-4241-8c43-80f2be39311d"
"C7DF2760-2C81-4EF7-B578-5B5392B571DF" = "a044b16a-1861-4308-8086-a3a3b506fac2"
"B8B749F8-A4EF-4887-9539-C95B1EAA5DB7" = "aca0c06c-890d-4abb-83cf-bc519a2565e5"
"D42C793F-6C78-4F43-92CA-E8F6A02B035F" = "14c61739-b45a-42c0-832c-d330972d3173"
"EFCCB6F7-5641-4E0E-BD10-B4976E1BF68E" = "79c29af7-3cd0-4a6f-b182-a81e31dec84e"
"E43B5B99-8DFB-405F-9987-DC307F34BCBD" = "4260988e-990d-479c-ae7b-f01ce8e1bb4d"
"18181A46-0D4E-45CD-891E-60AABD171B4E" = "91fd106f-4b2c-4938-95ac-f54f74e9a239"
"4EF96642-F096-40DE-A3E9-D83FB2F90211" = "a2706f86-868d-4048-989b-0c69e5c76b63"
"F991CECC-3F91-4CD0-A9A8-BF1C8167E029" = "30e97275-fad8-48d4-bc0a-81840365c119"
"D13EF257-988A-46F3-8FCE-F47484DD4550" = "4b608b64-3a27-4373-854c-fd33115a8ce1"
"4B9405B0-7788-4568-ADD1-99614E613B69" = "195416c1-3447-423a-b37b-ee59a99a19c4"
"EEAA9E98-75E5-4527-8087-B1AC1B175E86" = "348c75ca-8a29-4cfa-9870-1dbcee3fdbd2"
"295A8EB0-F78D-45C7-8B5B-1EED5ED02DFF" = "4d8f3b90-29b3-4e7b-b37c-4a435ddef1d9"
"4B590615-0888-425A-A965-B3BF7789848D" = "9c584cf1-8326-4ff4-8a23-0a833ddbcab0"
"98B6E773-24D4-4C0D-A968-6E787A1F8204" = "1b6263c0-b8fd-4706-98db-89d2ace5c1bf"
"7CFD9A2B-E110-4C39-BF20-C6A3F36A3121" = "dd3b57a3-5183-4ff8-9e3c-321f4298b58d"
"7653C627-BB62-404C-AA51-A553020EEAEA" = "70f46845-9394-4c6e-9350-3c0040b2eb4d"
"2E3C4023-80F6-4711-AA5D-29E0ECB46835" = "f72752c8-3e37-4c9b-a1a0-69e8442068dc"
"549C4EFE-09A2-462B-9393-9B57DFDEA76B" = "725d5132-22a7-42d8-8a9b-988549a565f7"
"05E9A617-0261-4CEE-BB44-138D3EF5D965" = "2b3b8d2d-10aa-4be4-b5fd-7f2feb0c3091"
"F245ECC8-75AF-4F8E-B61F-27D8114DE5F3" = "031c9e47-4802-4248-838e-778fb1d2cc05"
"C5928F49-12BA-48F7-ADA3-0D743A3601D5" = "b4d4b7f4-4089-43b6-9c44-de97b760fb11"
"9A1E33ED-9697-43F3-B84C-1B0959DBB1D4" = "88F9EB8A-0636-45E8-A601-553E0A48AA9E"
"2B9C8E7C-319C-43A2-A2A0-48C5C6161DE7" = "84a03d81-6b37-4d66-8d4a-faea24541538"
"EA126FC5-A19E-42E2-A731-DA9D437BFFCF" = "09fdfa2e-a64e-4589-a550-3416214d2594"
"F8A1DB68-BE16-40ED-86D5-CB42CE701560" = "800f4f3b-cfe1-42c1-9cea-675512810488"
"6FD2C87F-B296-42F0-B197-1E91E994B900" = "796b6b5f-613c-4e24-a17c-eba730d49c02"
"E578B273-6DB4-4691-BBA0-8D691F4DA603" = "7eb5101b-b893-4d63-92ca-72df3c71fafc"
"52C9382A-40F7-4FD4-AEEC-E6FAEA7725C1" = "0962a210-418f-4d36-ba9c-4f01c673f57c"
"3DD6CF57-D688-4EED-BA52-9E40B5468C3E" = "efe1183a-8fa0-4138-bf0a-5ae271ab6e3c"
"90B5E015-709A-4B8B-B08E-3200F994494C" = "c082b70a-0e63-47ca-9cf7-5a962a920452"
"776DF282-9FC0-4862-99E2-70E561B9909E" = "a4179d30-cc09-49f0-977e-dc2cb70b874f"
"A9732EC9-17D9-494C-A51C-D6B45B384DCB" = "69c67983-cf78-4102-83f6-3e5fd246864f"
"1277E1CF-7BE4-4A04-9AF1-E7E114EFAABC" = "06312e72-b89a-42ad-bd9a-b13c72b16526"
"45A2423B-E884-448D-A831-D9E139C52D2F" = "d903a2db-bf6f-4434-83f1-21ba44017813"
"E6778190-713E-4E4F-9119-8B8238DE25DF" = "90d3615e-aa96-478e-b6ce-8eb1e9a96b4b"
"078D2B04-F1BD-4111-BBD4-B4B1B354CEF4" = "16c9f982-a827-4003-a88e-e75df1927f27"
"DDFAE3E3-FCB2-4174-8EBD-3023CB213C8B" = "525a468b-18eb-4d4b-b556-02e2699de020"
"84A661C4-E949-4BD2-A560-ED7766FCAF2B" = "e59159fc-6f67-4599-b3cb-17ff4020f643"
"B05E124F-C7CC-45A0-A6AA-8CF78C946968" = "37402a1d-0c6e-4d49-baae-0e45bd8ecb44"
"19EC0D23-8335-4CBD-94AC-6050E30712FA" = "2f707c7c-2433-49a5-a437-9ca7cf40d3eb"
"66B55226-6B4F-492C-910C-A3B7A3C9D993" = "3451a3b0-8cda-44a7-bad7-c30be81c4aaa"
"80B2D799-D2BA-4D2A-8842-FB0D0F3A4B82" = "35a36b80-270a-44bf-9290-00545d350866"
"DF845CE7-05F9-4894-B5F2-11BBFBCFD2B6" = "dbd10351-5631-4a01-a643-00e8ff14e7b2"
"328DC228-00BC-48C6-8B09-1FBC8BC3435D" = "fbf0328a-8b0f-47a6-9483-dc2b36183fce"
"12B8C807-2E20-48FC-B453-542B6EE9D171" = "35eb491f-5484-496e-978b-f349eed3c699"
"C32F9321-A627-406D-A114-1F9C81AAAFAC" = "5699c6f3-cc7a-4212-9042-8f85ce30f4e0"
"98DEFDF7-F6C1-44F5-A1F6-943B6764E7A5" = "a19a625a-6780-4f8f-9a86-85979b7f82d0"
"90A8F363-DA30-4ECD-90A7-D3A6B203486D" = "45320ec9-9b8e-49d0-b900-f14141a0abd1"
"488BA24A-39A9-4473-8EE5-19291E71B002" = "f2c42110-ec7b-4434-b55e-1a9e456ac2f0"
"46974AED-363E-423C-9E6A-951037CEC495" = "a3a8a723-99a2-4129-bc40-046e6768f7a3"
"BF95FD32-576A-4742-8D7A-6DC4940B9532" = "0198ee56-db84-4f71-a798-f5a497ce20d6"
"53818B1B-4A27-454B-8896-0DBA576410E6" = "a56baa74-d4e3-49fd-b228-ca0b62d08bad"
"0C266DFF-15DD-4B49-8397-2BB16070ED52" = "c94271d8-b431-4a25-a3c5-a57737a1c909"
"0DAB259F-BF13-4952-B7F8-7DB8F131B28D" = "0f598efe-f330-4d79-b79f-c9480bb7ce3e"
"94763226-9B3C-4E75-A931-5C89701ABE66" = "512e27aa-19d1-4c38-b2cb-5813375c8201"
"314C4481-F395-4525-BE8B-2EC4BB1E9D91" = "c60e9cc5-7339-479e-8003-285f6bd195c7"
"EE656612-49FA-43E5-B67E-CB1FDF7699DF" = "3891169e-2323-45f7-95c2-4497cda23d1c"
"1E1A282C-9C54-43A2-9310-98EF728FAACE" = "e5aeedc5-e2f0-4099-aa45-95802034d7f8"
"749742BF-0D37-4158-A120-33567104DEEB" = "58cd6573-6784-4467-b2fc-1a06bb874ed6"
"06EBC4EE-1BB5-47DD-8120-11324BC54E06" = "8bdbb60b-e526-43e9-92ef-ab760c8e0b72"
"09015F9F-377F-4538-BBB5-F75CEB09358A" = "c78388f6-8d97-4ca9-9ae8-0be7d43439cb"
"D3B4FE1F-9992-4930-8ACB-CA6EC609365E" = "ded34535-507f-4246-8370-f9180318c537"
"ED01FAF2-1D88-4947-AE91-45CA18703A96" = "bf1f6907-1f8e-4f05-b327-4896d1395c15"
"4B244418-9658-4451-A2B8-B5E2B364E9BD" = "3f22d04e-9353-46c1-bf48-b6b0c0a55a66"
"B8C73455-4162-4C81-AA90-C9D93E9394E9" = "3dd9350b-27d6-4501-93a4-c8d107f1de47"
"CB2020B1-D8F6-41C0-9ACD-8FF3D6D7831B" = "F4753E83-1A85-4962-8D0A-C1DB12BC82AB"
"99049C9C-6011-4908-BF17-15F496E6519D" = "53fc25f7-6639-4f78-bb44-3c2dfec3ed40"
"CBDC14AB-D96C-4C30-B9F4-6ADA7CDC1D46" = "61795cab-2abd-43f6-88e9-c9adae5746e0"
"11E18856-EA6B-433F-BD25-4F986BFBCCBC" = "7c1c021e-87d7-454f-bed7-27590555409b"
"061F9ACE-7D42-4136-88AC-31DC755F143F" = "51e95709-dc35-4780-9040-22278cb7c0e1"
"3B555118-DA6A-4418-894F-7DF1E2096870" = "5392A891-CF7A-47C2-ABF2-E9D131CAD575"






}





$Sku = @{
    "SPB"                                = "Micorsoft 365 Business Premium"
    "SMB_BUSINESS"                       = "MICROSOFT 365 APPS FOR BUSINESS"
    "SMB_BUSINESS_ESSENTIALS"            = "MICROSOFT 365 BUSINESS BASIC"
    "M365_F1"                            = "Microsoft 365 F1"
    "O365_BUSINESS_ESSENTIALS"           = "MICROSOFT 365 BUSINESS BASIC"
    "O365_BUSINESS_PREMIUM"              = "MICROSOFT 365 BUSINESS STANDARD"
    "DESKLESSPACK"                       = "OFFICE 365 F3"
    "TEAMS_FREE"                         = "MICROSOFT TEAM (FREE)"
    "TEAMS_EXPLORATORY"                  = "MICROSOFT TEAMS EXPLORATORY" 
    "M365EDU_A3_STUDENT"                 = "MICROSOFT 365 A3 FOR STUDENTS"
    "M365EDU_A5_STUDENT"                 = "MICROSOFT 365 A5 FOR STUDENTS"
    "M365EDU_A3_FACULTY"                 = "MICROSOFT 365 A3 FOR FACULTY"
    "M365EDU_A5_FACULTY"                 = "MICROSOFT 365 A5 FOR FACULTY"
    "MCOEV_FACULTY"                      = "MICROSOFT 365 PHONE SYSTEM FOR FACULTY"
    "MCOEV_STUDENT"                      = "MICROSOFT 365 PHONE SYSTEM FOR STUDENTS"
    "ENTERPRISEPREMIUM_STUDENT"          = "Office 365 A5 for students"
    "ENTERPRISEPREMIUM_FACULTY"          = "Office 365 A5 for faculty"
    "M365EDU_A1"                         = "Microsoft 365 A1"
    "SHAREPOINTSTANDARD"                 = "SHAREPOINT ONLINE (PLAN 1)"
    "SHAREPOINTENTERPRISE"               = "SHAREPOINT ONLINE (PLAN 2)" 
    "EXCHANGEDESKLESS"                   = "EXCHANGE ONLINE KIOSK"
    "LITEPACK"                           = "OFFICE 365 SMALL BUSINESS"
    "EXCHANGESTANDARD"                   = "EXCHANGE ONLINE (PLAN 1)"
    "STANDARDPACK"                       = "OFFICE 365 E1"
    "STANDARDWOFFPACK"                   = "Office 365 (Plan E2)"
    "ENTERPRISEPACK"                     = "OFFICE 365 E3"
    "VISIOCLIENT"                        = "Visio Pro Online"
    "POWER_BI_ADDON"                     = "Office 365 Power BI Addon"
    "POWER_BI_INDIVIDUAL_USE"            = "Power BI Individual User"
    "POWER_BI_STANDALONE"                = "Power BI Stand Alone"
    "POWER_BI_STANDARD"                  = "Power-BI Standard"
    "PROJECTESSENTIALS"                  = "Project Lite"
    "PROJECTCLIENT"                      = "Project Professional"
    "PROJECTONLINE_PLAN_1"               = "Project Online"
    "PROJECTONLINE_PLAN_2"               = "Project Online and PRO"
    "ProjectPremium"                     = "Project Online Premium"
    "EMS"                                = "ENTERPRISE MOBILITY + SECURITY E3"
    "EMSPREMIUM"                         = "ENTERPRISE MOBILITY + SECURITY E5"
    "RIGHTSMANAGEMENT"                   = "AZURE INFORMATION PROTECTION PLAN 1"
    "MCOMEETADV"                         = "Microsoft 365 Audio Conferencing"
    "BI_AZURE_P1"                        = "POWER BI FOR OFFICE 365 ADD-ON"
    "INTUNE_A"                           = "INTUNE"
    "WIN_DEF_ATP"                        = "Microsoft Defender Advanced Threat Protection"
    "IDENTITY_THREAT_PROTECTION"         =  "Microsoft 365 E5 Security"
    "IDENTITY_THREAT_PROTECTION_FOR_EMS_E5" = "Microsoft 365 E5 Security for EMS E5"
    "ATP_ENTERPRISE"                     = "Office 365 Advanced Threat Protection (Plan 1)"
    "EQUIVIO_ANALYTICS"                  = "Office 365 Advanced eDiscovery"
    "AAD_BASIC"                          = "Azure Active Directory Basic"
    "RMS_S_ENTERPRISE"                   = "Azure Active Directory Rights Management"
    "AAD_PREMIUM"                        = "Azure Active Directory Premium"
    "STANDARDPACK_GOV"                   = "Microsoft Office 365 (Plan G1) for Government"
    "M365_G3_GOV"                        = "MICROSOFT 365 GCC G3"
    "ENTERPRISEPACK_USGOV_DOD"           = "Office 365 E3_USGOV_DOD"
    "ENTERPRISEPACK_USGOV_GCCHIGH"       = "Office 365 E3_USGOV_GCCHIGH"
    "ENTERPRISEPACK_GOV"                 = "OFFICE 365 GCC G3"
    "SHAREPOINTLITE"                     = "SharePoint Online (Plan 1)"
    "MCOIMP"                             = "SKYPE FOR BUSINESS ONLINE (PLAN 1)"
    "OFFICESUBSCRIPTION"                 = "MICROSOFT 365 APPS FOR ENTERPRISE"
    "YAMMER_MIDSIZE"                     = "Yammer"
    "DYN365_ENTERPRISE_PLAN1"            = "Dynamics 365 Customer Engagement Plan Enterprise Edition"
    "ENTERPRISEPREMIUM_NOPSTNCONF"       = "Enterprise E5 (without Audio Conferencing)"
    "ENTERPRISEPREMIUM"                  = "Enterprise E5 (with Audio Conferencing)"
    "MCOSTANDARD"                        = "Skype for Business Online Standalone Plan 2"
    "PROJECT_MADEIRA_PREVIEW_IW_SKU"     = "Dynamics 365 for Financials for IWs"
    "EOP_ENTERPRISE_FACULTY"             = "Exchange Online Protection for Faculty"
    "DYN365_FINANCIALS_BUSINESS_SKU"     = "Dynamics 365 for Financials Business Edition"
    "DYN365_FINANCIALS_TEAM_MEMBERS_SKU" = "Dynamics 365 for Team Members Business Edition"
    "FLOW_FREE"                          = "Microsoft Flow Free"
    "POWER_BI_PRO"                       = "Power BI Pro"
    "O365_BUSINESS"                      = "MICROSOFT 365 APPS FOR BUSINESS"
    "DYN365_ENTERPRISE_SALES"            = "Dynamics Office 365 Enterprise Sales"
    "PROJECTPROFESSIONAL"                = "Project Professional"
    "VISIOONLINE_PLAN1"                  = "Visio Online Plan 1"
    "EXCHANGEENTERPRISE"                 = "Exchange Online Plan 2"
    "DYN365_ENTERPRISE_P1_IW"            = "Dynamics 365 P1 Trial for Information Workers"
    "DYN365_ENTERPRISE_TEAM_MEMBERS"     = "Dynamics 365 For Team Members Enterprise Edition"
    "CRMSTANDARD"                        = "Microsoft Dynamics CRM Online Professional"
    "EXCHANGEARCHIVE_ADDON"              = "Exchange Online Archiving For Exchange Online"
    "SPZA_IW"                            = "App Connect"
    "WINDOWS_STORE"                      = "Windows Store for Business"
    "MCOEV"                              = "Microsoft Phone System"
    "MCOEV_GOV"                          = "MICROSOFT 365 PHONE SYSTEM FOR GCC"
    "SPE_E5"                             = "Microsoft 365 E5"
    "SPE_E3"                             = "Microsoft 365 E3"
    "MCOPSTN1"                           = "PSTN DOMESTIC CALLING"
    "MCOPSTN2"                           = "Domestic and International Calling Plan"
    "MCOPSTN_"                           = "MICROSOFT 365 DOMESTIC CALLING PLAN (120 Minutes)"
    "DYN365_TEAM_MEMBERS"                = "Dynamics 365 Team Members"
    "WIN10_PRO_ENT_SUB"                  = "WINDOWS 10 ENTERPRISE E3"
    "WIN10_VDA_E3"                       = "WINDOWS 10 ENTERPRISE E3"
    "WIN10_VDA_E5"                       = "Windows 10 Enterprise E5"
    "MDATP_XPLAT"                        = "Microsoft Defender for Endpoint"
    "CCIBOTS_PRIVPREV_VIRAL"             = "Power Virtual Agents Viral Trial"
    "ADALLOM_STANDALONE"                 = "Microsoft Cloud App Security"
    "BUSINESS_VOICE_MED2_TELCO"          = "Microsoft 365 Business Voice (US)"
    "POWERAPPS_PER_USER	"                = "Power Apps per user plan"
    "FLOW_PER_USER"                      = "Power Automate per user plan dept"
    "DYN365_BUSCENTRAL_PREMIUM"          = "Dynamics 365 Business Central Premium"
    "SMB_APPS"                           = "Business Apps (free)"
    "PHONESYSTEM_VIRTUALUSER"            = "MICROSOFT 365 PHONE SYSTEM - VIRTUAL USER"
}

$tenants = $clients.tenantid

Write-Host "Compiling all customer information. Please wait for the script to finish..."

ForEach($tenant in $tenants){

    $partnerinfo = get-msolpartnerinformation -tenantid $tenant
    $addressinfo = Get-MsolCompanyInformation -tenantid $tenant
    $subscriptioninfo = get-msolsubscription -TenantId $tenant
    $accountskuinfo = Get-MsolAccountSku -tenantid $tenant 
    $defaultdomain = Get-MsolDomain -tenantid $tenant | where {$_.IsDefault -Match "True"}
    $companyadminrole1 = Get-MsolRole -tenantid $tenant | where {$_.Name -match "Company Administrator"}
    $Admins1 = Get-MsolRoleMember -TenantId $tenant -RoleObjectId $companyadminrole1.objectID
    $companyadminrole2 = Get-MsolRole -tenantid $tenant | where {$_.Name -match "Billing Administrator"}
    $Admins2 = Get-MsolRoleMember -TenantId $tenant -RoleObjectId $companyadminrole2.objectID


    ForEach($sub in $accountskuinfo)
    {

        $renewalDate = $null

        ForEach($subDetail in $subscriptioninfo)
        {
            if ($sub.SubscriptionIds.Contains($subDetail.objectId)) {
                $renewalDate = $subDetail.Nextlifecycledate
            }
        }
       

       $properties = @{'Company Name' = $partnerinfo.PartnerCompanyName
		            'Company ZipCode' = $addressinfo.Postalcode
	                'Company Street' = $addressinfo.Street
                    'Company City' = $addressinfo.City
                    'Company State' = $addressinfo.State
                    'Company Telephone' = $addressinfo.TelephoneNumber
                    'Default Domain' = $defaultdomain.name
                    'Company Admins' = ($Admins1.EmailAddress | out-string).trim()
                    'Billing Admins' = ($Admins2.EmailAddress | out-string).trim()
                    'Consumed Units' = $sub.ConsumedUnits 
                    'Account Sku ID' = $sub.AccountSkuId 
                    'Directory ID' = $sub.AccountObjectId 
                    'SubscriptionIds' = [system.String]::Join(":", $sub.SubscriptionIds )
                    'SkuPartNumber' = $sub.SkuPartNumber 
                    'SkuId' = $sub.SkuId
                    'ActiveUnits' = $sub.ActiveUnits
                    'SuspendedUnits' = $sub.SuspendedUnits
                    'Product Name' = $Sku.Item($sub.SkuPartNumber)
                    'Offer ID' = $OfferIdMap[$sub.SkuId.ToString()]
                    'Renewal Date' = $renewalDate
                   
	        }
        
    
        $PropsObject = New-Object -TypeName PSObject -Property $Properties
        $PropsObject | Select-Object  "Company Name", "Company Zipcode", "Company Street", "Company City", "Company State", "Company TelephoneNumber", "Default Domain","Product Name","Offer ID", "Renewal Date", "Company Admins", "Billing Admins","Consumed Units", "ActiveUnits", "Directory ID", "SkuId", "SkuPartNumber", "SubscriptionIds" | Export-CSV -Path $customerList -NoTypeInformation -Append            
    }
}

$block = @"
 
                                ,_¦¦¦¯¯¯¯¯¯¯¯¯¯¦¦¦__
                           ,_¦¦¯(¦¦           `+¯¯¦¦_
                         ,¦¦¯¦¦¦                  +¯¦¦_,__¦¦¦¦¦¦@p+
                      ,,_¦¯                         `¯¦¦¯+¦'```¦¦¦¦¦¦N
                 __¦¦¦¯¯¯¯¦                           "           ¦¦+¦¦}
              _¦¦¯(¦¦                                              ¦ ¦+¦(+
            +¦¦¦¦                                            ,,,,       ¦¦¦w
           ¦¦`¦                                           +¦¦¦¦¦¦¦¦¦¦¦    +¦¦.n,
          Æ¦ ¦     ¦ B¦¦¦¦¦¦¦¦_+, __¦¦¦¦¦_++/&___+, ,___@¦¦¦¦¦¦¦¦¦¦¦¦¦        + n
         +¦ ¦        ¦¦¦¦¦¦¯¦¦¦¦¦¦¦¯¯¯¯¯¦¦¦¦¦¦¯¦¦¦¦¦¦¦¦¦¦+¦¦¦¦¦¦¦¦¦¦¦¦        ¦ +
         ¦¦          ¦¦¦¦¦¦¦ ¦¦¦¦¦µ_____¦¦¦¦¦¦ "¦¦¦¦¦¦¦¦  ¦¦¦¦¦¦¦¦¦¦¦¦        ¦ )
         ¦¦          ¦¦¦¦¦¦¦ ¦¦¦¦¦¦¦¦¯¯¯¯¦¦¦¦¦ ,¦¦¦¦¦¦¦¦ ¦¦¦¦¦+¦¯¦¦¦¦¦¦¦      ¦
         ¦¦          ¦¦¦¦¦¦¦+¦¦¦¦¦¦¦¦¦¦,_¦¦¦¦¦_¦¦¦¦¦¦¦¦¦+¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦      ]¦
          ¦_         ¦¦¦¦¦¦¦¦¦¦+++¦¦¦¦¦¦¦¦¦¦¦¦¦¦¯+¦ +¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦       ¦¦ `
          +¦_¦       ¦¦¦¦¦¦+''       `                     +¯¦¦¦¦¦¯+¦        ¦¦¦`
           `¦¦ ¦     ¦¦¦¦¦¦                                             ¦+_¦¦¯
             ¯¦m,¦                                                 ,+_¦¦¦¦¯+
               +¦¦¦'¦;,,,,,,,                          ,po+,,,,,+-¦¦¦¯+
                   "-8.,,,,;¦¦¦+,                  ,+g¦`,8.,,,,,Ä++
                              +¯¦¦¦__g,,,,,,,,+µæ¦¦¦¦æn
                                   "¯¯¦¦¦¦¦¦¦¦¦¦¯+"
  
 
"@
 
Write-Host $block -ForegroundColor Green
