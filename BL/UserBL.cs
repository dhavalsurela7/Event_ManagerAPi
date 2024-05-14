using System;
using System.Data;
using System.Data.SqlClient;
using Library;
using LIBRARY;
using Models;

namespace BL
{
    public class UserBL
    {
        /// <summary>
        /// Name : Dhaval Surela
        /// Date : 04/04/2024
        /// BL for User Register and Login
        /// </summary>

        public SerializeResponse<UserEntity> UserOperation(UserEntity objEntity)
        {
            InsertLog.WriteErrrorLog("UserBL=>UserOperation=>Started");
            ConvertDataTable bl = new ConvertDataTable();
            SerializeResponse<UserEntity> objSerializeResponse = new SerializeResponse<UserEntity>();

            DataSet ds = new DataSet();
            SqlDataProvider objSDP = new SqlDataProvider();
            string query = "sp_UserOperation";
            try
            {

                string Con_str = Connection.ConnectionString;
                SqlParameter prm1 = objSDP.CreateInitializedParameter("@flag", DbType.String, objEntity.flag);
                SqlParameter prm2 = objSDP.CreateInitializedParameter("@User_Name", DbType.String, objEntity.User_Name);
                SqlParameter prm3 = objSDP.CreateInitializedParameter("@User_Email", DbType.String, objEntity.User_Email);
                SqlParameter prm4 = objSDP.CreateInitializedParameter("@User_Address", DbType.String, objEntity.User_Address);
                SqlParameter prm5 = objSDP.CreateInitializedParameter("@User_Password", DbType.String, objEntity.User_Password);
                SqlParameter prm6 = objSDP.CreateInitializedParameter("@User_Mobile", DbType.String, objEntity.User_Mobile);



                SqlParameter[] Sqlpara = { prm1, prm2, prm3, prm4, prm5, prm6 };

                ds = SqlHelper.ExecuteDataset(Con_str, query, Sqlpara);
                //Register new user
                if (objEntity.flag == "register" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {

                    objSerializeResponse.Message = Convert.ToString(ds.Tables[0].Rows[0]["Message"]);
                    objSerializeResponse.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["Code"]);
                }
                //User Login 
                else if (objEntity.flag == "login" && ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    if (JWT.GenerateToken(objEntity.User_Email, "User") != "")
                    {
                        objSerializeResponse.Message = JWT.GenerateToken(objEntity.User_Email, "User");
                        objSerializeResponse.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["Code"]);

                    }
                    else
                    {
                        objSerializeResponse.Message = "Token not generated";
                        objSerializeResponse.ID = 500;
                    }


                }

                else
                {
                    objSerializeResponse.Message = "Flag is Invalid";
                    objSerializeResponse.ID = 500;

                }

            }
            catch (Exception ex)
            {
                objSerializeResponse.Message = "Exception Occurred";
                objSerializeResponse.ID = 500;
                InsertLog.WriteErrrorLog("UserBL=>UserOperation=>Exception" + ex.Message + ex.StackTrace);
            }
            return objSerializeResponse;
        }


        /// <summary>
        /// Name : Dhaval Surela
        /// Date : 11/05/2024
        /// Method for OTP Sending using Emaill
        /// </summary>

        public SerializeResponse<MailEntity> SendOtp(MailEntity objEntity)
        {



            InsertLog.WriteErrrorLog("MailSender=>send_OTP=>Started");
            SerializeResponse<MailEntity> objSerializeResponse = new SerializeResponse<MailEntity>();
            DataSet ds = new DataSet();
            DataSet ds2 = new DataSet();
            ConvertDataTable bl = new ConvertDataTable();
            SqlDataProvider objSDP = new SqlDataProvider();
            MailSender objMailSender = new MailSender();
            string query = "sp_GetTemplate";
            string query2 = "sp_SendOtp";
            try
            {


                string Con_str = Connection.ConnectionString;

                SqlParameter prm1 = objSDP.CreateInitializedParameter("@Name", DbType.String, "OTP");
                SqlParameter prm2 = objSDP.CreateInitializedParameter("@Email", DbType.String, objEntity.Email);

                SqlParameter[] Sqlpara = { prm1 };
                SqlParameter[] Sqlpara2 = { prm2 };
                ds = SqlHelper.ExecuteDataset(Con_str, query, Sqlpara);


                string Subject = bl.ListConvertDataTable<MailEntity>(ds.Tables[0])[0].Template_Subject;
                string Body = bl.ListConvertDataTable<MailEntity>(ds.Tables[0])[0].Template_Body;

                ds2 = SqlHelper.ExecuteDataset(Con_str, query2, Sqlpara2);

                if (ds2?.Tables.Count > 0 && ds2.Tables[0].Rows.Count > 0)
                {
                    string otp = bl.ListConvertDataTable<MailEntity>(ds2.Tables[0])[0].OTP;
                    Body = Body.Replace("[OTP]", otp);

                    objSerializeResponse.Message = "Data Found";
                    objSerializeResponse.ID = 200;

                }

                objMailSender.SendEmail(objEntity.Email, Subject, Body, true, null);





            }
            catch (Exception ex)
            {
                objSerializeResponse.Message = "Exception Occurred";
                objSerializeResponse.ID = 500;
                InsertLog.WriteErrrorLog("EventBL=>EventOperation=>Exception" + ex.Message + ex.StackTrace);

            }
            return objSerializeResponse;


        }



        public SerializeResponse<MailEntity> VerifyOtp(MailEntity objEntity)
        {
            InsertLog.WriteErrrorLog("UserBL=>VerifyOtp=>Started");
            ConvertDataTable bl = new ConvertDataTable();
            SerializeResponse<MailEntity> objSerializeResponse = new SerializeResponse<MailEntity>();

            DataSet ds = new DataSet();
            SqlDataProvider objSDP = new SqlDataProvider();
            string query = "sp_VerifyOtp";
            try
            {

                string Con_str = Connection.ConnectionString;
                SqlParameter prm1 = objSDP.CreateInitializedParameter("@Email", DbType.String, objEntity.Email);
                SqlParameter prm2 = objSDP.CreateInitializedParameter("@Otp", DbType.String, objEntity.OTP);
    
                



                SqlParameter[] Sqlpara = { prm1, prm2 };

                ds = SqlHelper.ExecuteDataset(Con_str, query, Sqlpara);
                //Register new user
                if ( ds?.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {

                    objSerializeResponse.Message = Convert.ToString(ds.Tables[0].Rows[0]["Message"]);
                    objSerializeResponse.ID = Convert.ToInt32(ds.Tables[0].Rows[0]["Code"]);
                }
                //User Login 
               
                else
                {
                    objSerializeResponse.Message = "Error ocurred";
                    objSerializeResponse.ID = 500;

                }

            }
            catch (Exception ex)
            {
                objSerializeResponse.Message = "Exception Occurred";
                objSerializeResponse.ID = 500;
                InsertLog.WriteErrrorLog("UserBL=>UserOperation=>Exception" + ex.Message + ex.StackTrace);
            }
            return objSerializeResponse;
        }


    }


}
