using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LIBRARY;
using Models;

namespace BL
{
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
            if (objEntity.Event_Image != null)
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



                SqlParameter[] Sqlpara = { prm1, prm2, prm3, prm4, prm5, prm6, prm7 };

                ds = SqlHelper.ExecuteDataset(Con_str, query, Sqlpara);
                if (objEntity.flag == "INSERT" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {

                    objSerializeResponse.Message = Convert.ToString(ds.Tables[0].Rows[0]["Message"]);
                }

                else if (objEntity.flag == "PUBLISH" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    objSerializeResponse.Message = Convert.ToString(ds.Tables[0].Rows[0]["Message"]);

                }
                else if (objEntity.flag == "UPDATE" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    objSerializeResponse.Message = Convert.ToString(ds.Tables[0].Rows[0]["Message"]);

                }
                else if (objEntity.flag == "DELETE" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    objSerializeResponse.Message = Convert.ToString(ds.Tables[0].Rows[0]["Message"]);

                }

                else if (objEntity.flag == "SELECTNAME" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {

                    objSerializeResponse.ArrayOfResponse = bl.ListConvertDataTable<EventEntity>(ds.Tables[0]);
                    objSerializeResponse.Message = "200|Data Found";


                }
                else if (objEntity.flag == "SELECTALL" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {

                    objSerializeResponse.ArrayOfResponse = bl.ListConvertDataTable<EventEntity>(ds.Tables[0]);
                    objSerializeResponse.Message = "200|Data Found";


                }
                else if (objEntity.flag == "SELECTONGOING" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {

                    objSerializeResponse.ArrayOfResponse = bl.ListConvertDataTable<EventEntity>(ds.Tables[0]);
                    objSerializeResponse.Message = "200|Data Found";


                }

                else if (objEntity.flag == "SELECT" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {

                    objSerializeResponse.ArrayOfResponse = bl.ListConvertDataTable<EventEntity>(ds.Tables[0]);
                    foreach (var item in objSerializeResponse.ArrayOfResponse)
                    {
                        if (item.Event_Image != null)
                        {
                            byte[] imagearray = System.IO.File.ReadAllBytes(item.Event_Image);
                            string base64image = Convert.ToBase64String(imagearray);
                            item.Event_Image = base64image;
                        }
                    }
                    objSerializeResponse.Message = "200|Data Found";

                }
            

                else
                {
                    objSerializeResponse.Message = "500|Error Occurred";

                }


            }
            catch (Exception ex)
            {
                objSerializeResponse.Message = "500|Exception Occurred";
                InsertLog.WriteErrrorLog("EventBL=>EventOperation=>Exception" + ex.Message + ex.StackTrace);
            }
            return objSerializeResponse;
        }
    }
}
