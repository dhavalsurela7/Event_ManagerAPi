using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LIBRARY
{
    public class Image
    {
        public static string SaveImage(string ImgStr, string EventName)
        {
            String path = AppDomain.CurrentDomain.BaseDirectory + "Images"; //Path

            //Check if directory exist
            if (Directory.Exists(path))
            {
                Directory.CreateDirectory(path); //Create directory if it doesn't exist
            }



            //set the image path
            string imgpath = AppDomain.CurrentDomain.BaseDirectory + EventName + ".png";

            byte[] imageBytes = Convert.FromBase64String(ImgStr);

            File.WriteAllBytes(imgpath, imageBytes);

            return imgpath;
        }
    }
}
