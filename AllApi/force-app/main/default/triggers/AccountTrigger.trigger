trigger AccountTrigger on Account (after update){
	if (Trigger.isAfter){
		if (Trigger.isUpdate){
			List<UpdateAccountTypePlaltFormEvent__e> updateList = new List<UpdateAccountTypePlaltFormEvent__e>();
			for (Account ac : Trigger.new){
				UpdateAccountTypePlaltFormEvent__euap = new UpdateAccountTypePlaltFormEvent__e();
				uap.Sample_Text_Field__c = 'Test';
				updateList.add(uap);
			}
			if (updateList.size() > 0){
				update updateList;
			}
		}
	}
}