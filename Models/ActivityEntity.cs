namespace Models
{
    public class ActivityEntity
    {
        public ActivityEntity()
        {

            flag = "";
            Activity_Description = "";
            Activity_Name = "";
            
            Activity_Price = "";
            Event_Name = "";

        }
        public string flag { get; set; }
        public string Activity_Description { get; set; }
        public string Activity_Name { get; set; }

        public string Activity_Start_Datetime { get; set; }

        public string Activity_End_Datetime { get; set; }

        public string Activity_Price { get; set; }

        public string Event_Name { get; set; }

    }
}
