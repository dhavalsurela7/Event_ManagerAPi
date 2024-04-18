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
    /// Controller for event
    /// uses EventBL
    /// </summary>
    public class EventController : ApiController
    {
        [HttpPost]
        [Route("api/EventController/EventOperation")]
        public HttpResponseMessage EventOperation(EventEntity request)
        {
            InsertLog.WriteErrrorLog("EventController=>EventOperation=>Request" + JsonConvert.SerializeObject(request));
            SerializeResponse<EventEntity> response = new SerializeResponse<EventEntity>();
            try
            {
                EventBL objEventBL = new EventBL();
                response = objEventBL.EventOperation(request);
            }
            catch (Exception ex)
            {
                response = new SerializeResponse<EventEntity>();
                response.Message = "500|Exception Occurred";
                InsertLog.WriteErrrorLog("EventController=>EventOperation=>Exception" + ex.Message.ToString() + "" + ex.StackTrace.ToString());
            }
            return Request.CreateResponse(HttpStatusCode.OK, response);
        }
    }
}
