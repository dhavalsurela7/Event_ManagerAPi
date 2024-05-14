using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BL;
using LIBRARY;
using Models;
using Newtonsoft.Json;

namespace Event_Manager.Controllers
{
    /// <summary>
    /// Name : Dhaval Surela
    /// Date : 04/04/2024
    /// Contains api for Inserting User and login user
    /// uses UserBl
    /// here we perform insert, and login operation for user
    /// </summary>
    public class UserController : ApiController
    {

        [HttpPost]
        [Route("api/UserController/UserOperation")]
        public HttpResponseMessage UserOperation(UserEntity request)
        {
            InsertLog.WriteErrrorLog("UserController=>UserOperation=>Request" + JsonConvert.SerializeObject(request));
            SerializeResponse<UserEntity> response = new SerializeResponse<UserEntity>();
            try
            {
                UserBL objUserBL = new UserBL();
                response = objUserBL.UserOperation(request);
            }
            catch (Exception ex)
            {
                response = new SerializeResponse<UserEntity>();
                response.Message = "500|Exception Occurred";
                InsertLog.WriteErrrorLog("UserController=>UserOperation=>Exception" + ex.Message.ToString() + "" + ex.StackTrace.ToString());
            }
            return Request.CreateResponse(HttpStatusCode.OK, response);
        }

        [HttpPost]
        [Route("api/UserController/SendOtp")]
        public HttpResponseMessage SendOtp(MailEntity request)
        {
            InsertLog.WriteErrrorLog("UserController=>SendOtp=>Request" + JsonConvert.SerializeObject(request));
            SerializeResponse<MailEntity> response = new SerializeResponse<MailEntity>();
            try
            {
                UserBL objUserBL = new UserBL();
                response = objUserBL.SendOtp(request);
            }
            catch (Exception ex)
            {
                response = new SerializeResponse<MailEntity>();
                response.Message = "500|Exception Occurred";
                InsertLog.WriteErrrorLog("UserController=>SendOtp=>Exception" + ex.Message.ToString() + "" + ex.StackTrace.ToString());
            }
            return Request.CreateResponse(HttpStatusCode.OK, response);
        }


        [HttpPost]
        [Route("api/UserController/VerifyOtp")]
        public HttpResponseMessage VerifyOtp(MailEntity request)
        {
            InsertLog.WriteErrrorLog("UserController=>VerifyOtp=>Request" + JsonConvert.SerializeObject(request));
            SerializeResponse<MailEntity> response = new SerializeResponse<MailEntity>();
            try
            {
                UserBL objUserBL = new UserBL();
                response = objUserBL.VerifyOtp(request);
            }
            catch (Exception ex)
            {
                response = new SerializeResponse<MailEntity>();
                response.Message = "500|Exception Occurred";
                InsertLog.WriteErrrorLog("UserController=>VerifyOtp=>Exception" + ex.Message.ToString() + "" + ex.StackTrace.ToString());
            }
            return Request.CreateResponse(HttpStatusCode.OK, response);
        }
    }
}
