namespace Models
{
    public class EventEntity
    {
        public EventEntity()
        {
            flag = "";
            Event_Name = "";
     
            Event_Image = "";
            Event_Description = "";
            New_Event_Name = "";
        }
        public string flag { get; set; }
        public string Event_Name { get; set; }

        public string Event_Start_Date { get; set; }

        public string Event_End_Date { get; set; }

        public string Event_Image { get; set; }

        public string Event_Description { get; set; }
        public string New_Event_Name { get; set; }
        public string isActive { get; set; }


    }
}
