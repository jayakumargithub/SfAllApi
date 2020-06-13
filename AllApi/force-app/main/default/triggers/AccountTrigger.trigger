trigger AccountTrigger on Account (after update){
	if (Trigger.isAfter){
		if (Trigger.isUpdate){
			List<UpdateAccountTypePlaltFormEvent__e> updateList = new List<UpdateAccountTypePlaltFormEvent__e>();
			for (Account ac : Trigger.new){
				UpdateAccountTypePlaltFormEvent__e uap = new UpdateAccountTypePlaltFormEvent__e();
				uap.Sample_Text_Field__c = 'Test';
                uap.AccountId__c = ac.Id;
				updateList.add(uap);
                System.debug('INside trigger');
			}
			if (updateList.size() > 0){
				 List<Database.SaveResult> eventPubResult = EventBus.publish(updateList);
                for(Database.SaveResult result : eventPubResult){
                     System.debug(result);
                    if(result.isSuccess()){
                        System.debug('Events published successfully > '+ result); 
                    }
                    else{
                        for(Database.Error err : result.getErrors()){
                            System.debug('Event published failed ' + err.getStatusCode() + ' - '+ err.getMessage());
                        }
                    }
                }
			}
		}
	}
}