namespace Models
{
    public class UserEntity
    {
        public UserEntity()
        {
            flag = "";
            User_Name = "";
            User_Email = "";
            User_Address = "";
            User_Password = "";
            User_Mobile = "";
        }
        public string flag { get; set; }

        public string User_Name { get; set; }

        public string User_Email { get; set; }

        public string User_Address { get; set; }

        public string User_Password { get; set; }

        public string User_Mobile { get; set; }
    }
}
