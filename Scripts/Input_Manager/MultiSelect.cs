using System.Collections;
using System.Collections.Generic;
using UnityEngine;


namespace RTS.FDG.InputManager
{
    public static class MultiSelect
    {
        private static Texture2D _whiteTexture;

        public static Texture2D WhiteTexture
        {
            get
            {
                if(_whiteTexture==null)
                {
                    _whiteTexture = new Texture2D(1,1);
                    _whiteTexture.SetPixel(0,0,Color.white);
                    _whiteTexture.Apply();
                }
                return _whiteTexture;
            }
        }
        public static void DrawScreenRec(Rect rect, Color color)
        {
            GUI.color = color;
            GUI.DrawTexture(rect, WhiteTexture);
        }
        public static void DrawScreenRecBorder(Rect rect, float thickness, Color color)
        {
            //Top
            DrawScreenRec(new Rect(rect.xMin, rect.yMin, rect.width, thickness), color);
            //Bottom
            DrawScreenRec(new Rect(rect.xMin, rect.yMax- thickness, rect.width, thickness),color);
            //Left Side
            DrawScreenRec(new Rect(rect.xMin, rect.yMin, thickness, rect.height), color);
            //Right Side
            DrawScreenRec(new Rect(rect.xMax - thickness, rect.yMin, thickness, rect.height), color);
        }
        public static Rect GetScreenRect(Vector3 screenpos1, Vector3 screenpos2)
        {
            //from  bottom right to top left
            screenpos1.y = Screen.height - screenpos1.y;
            screenpos2.y = Screen.height - screenpos2.y;

            //corners
            Vector3 bottomR = Vector3.Max(screenpos1, screenpos2);
            Vector3 topL = Vector3.Min(screenpos1, screenpos2);

            //create rectangle
            return Rect.MinMaxRect(topL.x, topL.y, bottomR.x, bottomR.y);
        }

        public static Bounds GetViewBounds(Camera camera, Vector3 screenpos1, Vector3 screenpos2)
        {
            Vector3 pos1 = camera.ScreenToViewportPoint(screenpos1);
            Vector3 pos2 = camera.ScreenToViewportPoint(screenpos2);

            Vector3 min = Vector3.Min(pos1, pos2);
            Vector3 max = Vector3.Max(pos1, pos2);

            min.z = camera.nearClipPlane;
            max.z = camera.farClipPlane;

            Bounds bounds = new Bounds();
            bounds.SetMinMax(min, max);

            return bounds;
        }

    }

}
