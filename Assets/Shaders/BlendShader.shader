Shader "MyShader/BlendShader"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
		Tags{"Queue" = "Transparent"}
		Blend SrcAlpha OneMinusSrcAlpha
		Pass{
			SetTexture [_MainTex] {combine texture}
		}
  
    }
    FallBack "Diffuse"
}
