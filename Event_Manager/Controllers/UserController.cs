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
    /// Contains api for Inserting User and login user
    /// uses UserBl
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

    }
}
