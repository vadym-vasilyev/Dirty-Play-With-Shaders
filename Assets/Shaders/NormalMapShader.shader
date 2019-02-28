Shader "MyShader/NormalMapShader"
{
    Properties {
        _texture ("Diffuse Texture", 2D) = "white" {}
        _normalMap ("Bump Texture", 2D) = "bump" {}
        _mySlider ("Bump Amount", Range(0,10)) = 1
    }
    SubShader {

      CGPROGRAM
        #pragma surface surf Lambert
        
        sampler2D _texture;
        sampler2D _normalMap;
        half _mySlider;

        struct Input {
            float2 uv_texture;
            float2 uv_normalMap;
        };
        
        void surf (Input IN, inout SurfaceOutput o) {
            o.Albedo = tex2D(_texture, IN.uv_texture).rgb;
            o.Normal = UnpackNormal(tex2D(_normalMap, IN.uv_normalMap));
            o.Normal *= float3(_mySlider,_mySlider,1);
        }
      
      ENDCG
    }
    Fallback "Diffuse"
}
