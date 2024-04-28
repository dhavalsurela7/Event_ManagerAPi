namespace Models
{
    public class AdminEntity
    {
        public AdminEntity()
        {
            flag = "";
            Admin_Name = "";
            Admin_Email = "";
            Admin_Address = "";
            Admin_Password = "";
            Admin_Mobile = "";
        }
        public string flag { get; set; }

        public string Admin_Name { get; set; }

        public string Admin_Email { get; set; }

        public string Admin_Address { get; set; }

        public string Admin_Password { get; set; }

        public string Admin_Mobile { get; set; }
    }
}
