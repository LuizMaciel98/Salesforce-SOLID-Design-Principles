public with sharing class UIWrapperService{
    Map<String, Type> objectAndUITypeToWrapperImpl = new Map<String, Type>() {
        'ContactMapMarker' => MapMarkerContact_Imp.class,
        'LeadMapMarker' => MapMarkerLead_Impl.class
    };
    
	public static List<SObject> getRecords(String objectType, String uiType){
		DisplayWrapper_Interface wrapperInterface = (DisplayWrapper_Interface)objectAndUITypeToWrapperImpl.get(objectType+uiType).newInstance();
		return wrapperInterface.getRecords();
	}

    public static List<Object> wrapRecordsForUI(List<SObject> sObjectRecords, String uiType){
        DisplayWrapper_Interface wrapperInterface = (DisplayWrapper_Interface) objectAndUITypeToWrapperImpl.get(sObjectRecords[0].getSObjectType() + '' + uiType).newInstance();
        return wrapperInterface.wrapRecordsForUI(sObjectRecords);
    }
}