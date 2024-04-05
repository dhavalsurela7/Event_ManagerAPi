using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Newtonsoft.Json;
using BL;
using LIBRARY;
using Models;

namespace Event_Manager.Controllers
{
    /// <summary>
    /// Controller for User Table
    /// Contains api for Inserting User
    /// uses UserOperationsBl
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
