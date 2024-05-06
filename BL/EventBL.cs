using System;
using System.Data;
using System.Data.SqlClient;
using LIBRARY;
using Models;

namespace BL
{
    /// <summary>
    /// Name : Dhaval Surela
    /// Date : 04/04/2024
    /// Bl for operations like insert, update, delete,select on Event Table
    /// </summary>
    public class EventBL
    {
        public SerializeResponse<EventEntity> EventOperation(EventEntity objEntity)
        {
            InsertLog.WriteErrrorLog("EventBL=>EventOperation=>Started");
            ConvertDataTable bl = new ConvertDataTable();
            SerializeResponse<EventEntity> objSerializeResponse = new SerializeResponse<EventEntity>();

            DataSet ds = new DataSet();
            SqlDataProvider objSDP = new SqlDataProvider();
            string image = null;
            string query = "sp_EventOperation";
            if (objEntity.Event_Image != null && objEntity.Event_Image != "")
            {
                image = Image.SaveImage(objEntity.Event_Image, objEntity.Event_Name);

            }

            try
            {

                string Con_str = Connection.ConnectionString;
                SqlParameter prm1 = objSDP.CreateInitializedParameter("@flag", DbType.String, objEntity.flag);
                SqlParameter prm2 = objSDP.CreateInitializedParameter("@Event_Name", DbType.String, objEntity.Event_Name);
                SqlParameter prm3 = objSDP.CreateInitializedParameter("@Event_Start_Date", DbType.String, objEntity.Event_Start_Date);
                SqlParameter prm4 = objSDP.CreateInitializedParameter("@Event_End_Date", DbType.String, objEntity.Event_End_Date);
                SqlParameter prm5 = objSDP.CreateInitializedParameter("@Event_Image", DbType.String, image);
                SqlParameter prm6 = objSDP.CreateInitializedParameter("@Event_Description", DbType.String, objEntity.Event_Description);
                SqlParameter prm7 = objSDP.CreateInitializedParameter("@New_Event_Name", DbType.String, objEntity.New_Event_Name);
                SqlParameter prm8 = objSDP.CreateInitializedParameter("@Event_Id", DbType.String, objEntity.Event_Id);



                SqlParameter[] Sqlpara = { prm1, prm2, prm3, prm4, prm5, prm6, prm7,prm8 };

                ds = SqlHelper.ExecuteDataset(Con_str, query, Sqlpara);

                //Insert event
                if (objEntity.flag == "INSERT" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {

                    objSerializeResponse.Message = Convert.ToString(ds.Tables[0].Rows[0]["Message"]);
                    objSerializeResponse.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["Code"]);
                }
                //Publish event ( set isactive = 1 )
                else if (objEntity.flag == "PUBLISH" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    objSerializeResponse.Message = Convert.ToString(ds.Tables[0].Rows[0]["Message"]);
                    objSerializeResponse.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["Code"]);

                }
                else if (objEntity.flag == "UNPUBLISH" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    objSerializeResponse.Message = Convert.ToString(ds.Tables[0].Rows[0]["Message"]);
                    objSerializeResponse.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["Code"]);

                }
                //Update event
                else if (objEntity.flag == "UPDATE" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    objSerializeResponse.Message = Convert.ToString(ds.Tables[0].Rows[0]["Message"]);
                    objSerializeResponse.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["Code"]);

                }
                //Delete event
                else if (objEntity.flag == "DELETE" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    objSerializeResponse.Message = Convert.ToString(ds.Tables[0].Rows[0]["Message"]);
                    objSerializeResponse.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["Code"]);

                }
                //Select unpublished events
                else if (objEntity.flag == "SELECTNAME" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {

                    objSerializeResponse.ArrayOfResponse = bl.ListConvertDataTable<EventEntity>(ds.Tables[0]);
                    objSerializeResponse.Message = "Data Found";
                    objSerializeResponse.ID = 200;


                }
                //Select all events
                else if (objEntity.flag == "SELECTALL" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {

                    objSerializeResponse.ArrayOfResponse = bl.ListConvertDataTable<EventEntity>(ds.Tables[0]);
                    foreach (var item in objSerializeResponse.ArrayOfResponse)
                    {
                        if (item.Event_Image != null)
                        {
                            item.Event_Image = Image.GetImage(item.Event_Image);
                        }
                    }
                    objSerializeResponse.Message = "Data Found";
                    objSerializeResponse.ID = 200;


                }
                //Select ongoing events
                else if (objEntity.flag == "SELECTONGOING" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {

                    objSerializeResponse.ArrayOfResponse = bl.ListConvertDataTable<EventEntity>(ds.Tables[0]);
                    objSerializeResponse.Message = "Data Found";
                    objSerializeResponse.ID = 200;


                }
                //Select Published events
                else if (objEntity.flag == "SELECT" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {

                    objSerializeResponse.ArrayOfResponse = bl.ListConvertDataTable<EventEntity>(ds.Tables[0]);
                    foreach (var item in objSerializeResponse.ArrayOfResponse)
                    {
                        if (item.Event_Image != null)
                        {
                            item.Event_Image = Image.GetImage(item.Event_Image);
                        }
                    }
                    objSerializeResponse.Message = "Data Found";
                    objSerializeResponse.ID = 200;

                }

                else
                {
                    objSerializeResponse.Message = "Error Occurred";
                    objSerializeResponse.ID = 500;

                }


            }
            catch (Exception ex)
            {
                objSerializeResponse.Message = "Exception Occurred";
                objSerializeResponse.ID = 500;
                InsertLog.WriteErrrorLog("EventBL=>EventOperation=>Exception" + ex.Message + ex.StackTrace);
            }
            return objSerializeResponse;
        }
    }
}
