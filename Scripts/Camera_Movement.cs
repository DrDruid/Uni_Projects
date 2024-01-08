using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Camera_Movement : MonoBehaviour
{
    float speed=0.006f;
    float zoomspeed=1.0f;
    float rotatespeed= 0.001f;

    float maxheight = 200f;
    float minheight = 106.2f;

    Vector2 rot1;
    Vector2 rot2;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetKey(KeyCode.LeftShift))
        {
            speed = 0.006f;
            zoomspeed = 20.0f;
        }
        else
        {
            speed = 0.0035f;
            zoomspeed = 10.0f;

        }


        float hsp = transform.position.y * speed * Input.GetAxis("Horizontal");
        float vsp = transform.position.y * speed * Input.GetAxis("Vertical");
        float scrollsp = Mathf.Log(transform.position.y) * -zoomspeed * Input.GetAxis("Mouse ScrollWheel");


        if((transform.position.y>= maxheight)&&(scrollsp>0))
        {
            scrollsp = 0;
        }
        else if ((transform.position.y <= minheight)&&(scrollsp<0))
        {
            scrollsp = 0;
        }

        if ((transform.position.y + scrollsp)>maxheight)
        {
            scrollsp = maxheight - transform.position.y;
        }
        else if ((transform.position.y + scrollsp)< minheight)
        {
            scrollsp = minheight - transform.position.y;
        }

        Vector3 verticalMove = new Vector3(0, scrollsp, 0);
        Vector3 lateralMove = hsp * transform.right;
        Vector3 forwardMove = transform.forward;
        forwardMove.y = 0;
        forwardMove.Normalize();
        forwardMove *= vsp;

        Vector3 movement = verticalMove + lateralMove + forwardMove;
        transform.position += movement;
        getCameraRot();
        
    }
    void getCameraRot()
    {
        if(Input.GetMouseButtonDown(2))
        {
            rot1 = Input.mousePosition;

        }
        if(Input.GetMouseButton(2))
        {
            rot2 = Input.mousePosition;
            float dx = (rot2 - rot1).x * rotatespeed;
            float dy = (rot2 - rot1).y * rotatespeed;
            transform.rotation *= Quaternion.Euler(new Vector3(0, dx, 0));
            transform.GetChild(0).transform.rotation *= Quaternion.Euler(new Vector3(-dy, 0, 0));

           
        }
    }
}
