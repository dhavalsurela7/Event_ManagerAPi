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
    /// Name ; Dhaval Surela
    /// Date ; 04/04/2024
    /// Contains api for Admin login
    /// uses AdminBl
    /// here we perform login operation for admin table
    /// </summary>
    public class AdminController : ApiController
    {

        [HttpPost]
        [Route("api/AdminController/AdminOperation")]
        public HttpResponseMessage AdminOperation(AdminEntity request)
        {
            InsertLog.WriteErrrorLog("AdminController=>AdminOperation=>Request" + JsonConvert.SerializeObject(request));
            SerializeResponse<AdminEntity> response = new SerializeResponse<AdminEntity>();
            try
            {
                AdminBL objAdminBL = new AdminBL();
                response = objAdminBL.AdminOperation(request);
            }
            catch (Exception ex)
            {
                response = new SerializeResponse<AdminEntity>();
                response.Message = "500|Exception Occurred";
                InsertLog.WriteErrrorLog("AdminController=>AdminOperation=>Exception" + ex.Message.ToString() + "" + ex.StackTrace.ToString());
            }
            return Request.CreateResponse(HttpStatusCode.OK, response);
        }

    }
}
