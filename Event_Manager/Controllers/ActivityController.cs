using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BL;
using LIBRARY;
using Models;
using Newtonsoft.Json;

namespace Activity_Manager.Controllers
{
    public class ActivityController : ApiController
    {
        [HttpPost]
        [Route("api/ActivityController/ActivityOperation")]
        public HttpResponseMessage ActivityOperation(ActivityEntity request)
        {
            InsertLog.WriteErrrorLog("ActivityController=>ActivityOperation=>Request" + JsonConvert.SerializeObject(request));
            SerializeResponse<ActivityEntity> response = new SerializeResponse<ActivityEntity>();
            try
            {
                ActivityBL objActivityBL = new ActivityBL();
                response = objActivityBL.ActivityOperation(request);
            }
            catch (Exception ex)
            {
                response = new SerializeResponse<ActivityEntity>();
                response.Message = "500|Exception Occurred";
                InsertLog.WriteErrrorLog("ActivityController=>ActivityOperation=>Exception" + ex.Message.ToString() + "" + ex.StackTrace.ToString());
            }
            return Request.CreateResponse(HttpStatusCode.OK, response);
        }
    }
}
