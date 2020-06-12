public class PushAccountUpdateTopic{
	public static void Push(){
		PushTopicpushTopic = new PushTopic();
		pushTopic.Name = 'UpdateAccountType';
		pushTopic.Query = 'SELECT Id, Name, Type, AnnualRevenue   from Account';
		pushTopic.ApiVersion = 48.0;
		pushTopic.NotifyForOperationCreate = true;
		pushTopic.NotifyForOperationUpdate = true;
		pushTopic.NotifyForOperationUndelete = true;
		pushTopic.NotifyForOperationDelete = true;
		insert pushTopic;
	}
}