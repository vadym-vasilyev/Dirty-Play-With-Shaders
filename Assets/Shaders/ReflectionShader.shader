Shader "MyShader/ReflectionShader"
{
    Properties {
        _texture ("Diffuse Texture", 2D) = "white" {}
        _normalMap ("Bump Texture", 2D) = "bump" {}
        _normalSlider ("Bump Amount", Range(0,10)) = 1
		_bright ("Bright Amount", Range(0,10)) = 1
		_myCube ("Cube Map", CUBE) = "white" {}
    }
    SubShader {

      CGPROGRAM
        #pragma surface surf Lambert
        
        sampler2D _texture;
        sampler2D _normalMap;
        half _normalSlider;
		half _bright;
		samplerCUBE _myCube;

        struct Input {
            float2 uv_texture;
            float2 uv_normalMap;
			 float3 worldRefl; INTERNAL_DATA
        };
        
        void surf (Input IN, inout SurfaceOutput o) {
            o.Albedo = tex2D(_texture, IN.uv_texture).rgb;
            o.Normal = UnpackNormal(tex2D(_normalMap, IN.uv_normalMap)) * _bright;
            o.Normal *= float3(_normalSlider,_normalSlider,1);
            o.Emission = texCUBE (_myCube, WorldReflectionVector (IN, o.Normal)).rgb;
        }
      
      ENDCG
    }
    Fallback "Diffuse"
}
