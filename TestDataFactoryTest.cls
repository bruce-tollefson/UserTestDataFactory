@isTest
//not needed since TestDataFactory has @isTest annotation
public class TestDataFactoryTest {
    
    @isTest
    public static void createUsersIntegers(){
        Test.startTest();
        Try{
            User user1 = TestDataFactory.createUsers(1,true,'System Administrator')[0];
            User user2 = TestDataFactory.createUsers(1,true,'System Administrator')[0];
        }catch(Exception e){
            system.assert(false, 'You should not have gotten here');
        }
        Test.stopTest();
        List<User> userList = [Select Id from User where LastName = 'Test'];
        System.assertEquals(2, userList.size(), 'Unless someone has a last name of Test in the org already this should be 2');
    }
    
    @isTest
    public static void createUsersPrefix(){
        Test.startTest();
        Try{
            User user3 = TestDataFactory.createUsers(1,true,'System Administrator', 'TestDataFactoryTest')[0];
        }catch(Exception e){
            system.assert(true, 'You should not have gotten here');
        }
        Test.stopTest();
        List<User> userList = [Select Id from User where FirstName = 'TestDataFactoryTest'];
        System.assertEquals(1, userList.size(), 'Unless someone has a first name of TestDataFactoryTest in the org already this should be 1');
    }
    
    @isTest
    public static void createUsersPrefixNegative(){
        Test.startTest();
        Try{
            User user3 = TestDataFactory.createUsers(1,true,'System Administrator', 'TestDataFactoryTest')[0];
            User user4 = TestDataFactory.createUsers(1,true,'System Administrator', 'TestDataFactoryTest')[0];
        }catch(Exception e){
            system.assertEquals('System.DmlException', e.getTypeName(), 'There should have been a duplicate Error');
            String error = 'Insert failed. First exception on row 0; first error: DUPLICATE_USERNAME, Duplicate Username.<br>The username already exists in this or another Salesforce organization. Usernames must be unique across all Salesforce organizations. To resolve, use a different username (it doesn\'t need to match the user\'s email address). : [Username]';
            system.assertEquals(error,e.getMessage(), 'Duplicate Username');
        }
        Test.stopTest();
    }
}