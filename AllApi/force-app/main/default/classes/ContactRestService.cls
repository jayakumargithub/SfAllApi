@RestResource(UrlMapping = 
'/Contact/*')
global with sharing class ContactRestService{
	@HttpGet
	global static List<Contact> Get(){
		RestRequest request = RestContext.request;
		RestResponse response = RestContext.response;
		List<Contact> contacts = new List<Contact>();
		string name = request.params.get('lastname');
		string num = request.params.get('mynum');
		string boo = request.params.get('myboo');
		System.debug('name: ' + name + ' num: ' + num + ' boo ' + boo);
		if (name == null){
			contacts = [SELECT Id, lastname, firstName
			            from Contact ];
		} else{
			contacts = [SELECT Id, lastname, firstName
			            from Contact 
			            where lastname like :name + '%'];
		}
		return contacts;
	}

	public class ContactResult{
		public string Id{
			get;

			set;
		}

		public string LastName{
			get;

			set;
		}

		public string FirstName{
			get;

			set;
		}
	}
}