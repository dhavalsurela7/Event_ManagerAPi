using System;
using System.IO;

namespace LIBRARY
{
    /// <summary>
    /// Author : Dhaval Surela
    /// Date : 05/04/2024
    /// Class for Image related methods
    /// </summary>
    public class Image
    {
        //Converts Base64 to image and stores it
        public static string SaveImage(string ImgStr, string EventName)
        {
            String path = AppDomain.CurrentDomain.BaseDirectory + AppSetting.Image; //Path

            //Check if directory exist
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path); //Create directory if it doesn't exist
            }

            string imagname = EventName + ".png";

            //set the image path
            string imgpath = path+ imagname;

            byte[] imageBytes = Convert.FromBase64String(ImgStr);

            File.WriteAllBytes(imgpath, imageBytes);

            return imagname;
        }


        //Converts Image to Base64
        public static string GetImage(string ImgStr)
        {
            string path = AppDomain.CurrentDomain.BaseDirectory+ AppSetting.Image + ImgStr;
            byte[] imagearray = System.IO.File.ReadAllBytes(path);
            string base64image = Convert.ToBase64String(imagearray);
            return base64image;

        }
    }
}
