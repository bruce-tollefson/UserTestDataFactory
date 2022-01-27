@isTest
public class TestDataFactory {
    /**
        @description create Users
        @return List<User> of users
        @param numberOfUsers - number of users to return in list
        @param insertUsers - if the list should be inserted before returned
        @param profileName - the profile the user should have
    */
    public static List<User> createUsers(Integer numberOfUsers, Boolean insertUsers, String profileName){
        List<User> userList = new List<User>();
        Id profileId = [SELECT Id FROM Profile WHERE Name=:profileName].Id;
        for(Integer i=0; i<numberOfUsers; i++){
            User u = new User();
            u.Alias = String.valueOf(i);
            u.Email = 'testuser@test.com';
            u.EmailEncodingKey = 'UTF-8';
            u.LastName = 'Test';
            u.FirstName = String.valueOf(i);
            u.LanguageLocaleKey='en_US';
            u.LocaleSidKey = 'en_US';
            u.ProfileId = profileId;
            u.TimeZoneSidKey = 'America/Los_Angeles';
            u.Username = 'testuser'+i+'@test.com'+String.valueOf(Crypto.getRandomInteger()).substring(1,5);
            userList.add(u);
            
        }
        
        if(insertUsers){
            insert userList;
        }
        return userList;
    }

        /**
        @description create Users
        @return List<User> of users
        @param numberOfUsers - number of users to return in list
        @param insertUsers - if the list should be inserted before returned
        @param profileName - the profile the user should have
    */
    public static List<User> createUsers(Integer numberOfUsers, Boolean insertUsers, String profileName, String prefix){
        List<User> userList = new List<User>();
        Id profileId = [SELECT Id FROM Profile WHERE Name=:profileName].Id;
        for(Integer i=0; i<numberOfUsers; i++){
            User u = new User();
            u.Alias = String.valueOf(i);
            u.Email = 'testuser@test.com';
            u.EmailEncodingKey = 'UTF-8';
            u.LastName = 'Test '+String.valueOf(i);
            u.FirstName = prefix;
            u.LanguageLocaleKey='en_US';
            u.LocaleSidKey = 'en_US';
            u.ProfileId = profileId;
            u.TimeZoneSidKey = 'America/Los_Angeles';
            u.Username = prefix+i+'@test.com';
            userList.add(u);
            
        }
        
        if(insertUsers){
            insert userList;
        }
        return userList;
    }
}