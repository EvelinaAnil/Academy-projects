using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GroundDetection : MonoBehaviour
{
    public bool isGrounded = false;

    public void OnCollisionStay2D(Collision2D col)
    {
        isGrounded = true;
    }

    private void OnCollisionExit2D(Collision2D col)
    {
        isGrounded = false;
    }
}
