Shader "MyShader/SurfaceTextureShader"
{
     Properties {
        _lightMultiplier ("Light multiplier", Range(0,5)) = 1
        _mainTex ("Texture", 2D) = "white" {}
        _emission ("Emission", CUBE) = "white" {}
    }
    SubShader {

      CGPROGRAM
        #pragma surface surf Lambert
        
        half _lightMultiplier;
		half _alpha;
        sampler2D _mainTex;
        samplerCUBE _emission;

        struct Input {
            float2 uv_mainTex;
            float3 worldRefl;
        };
        
        void surf (Input IN, inout SurfaceOutput o) {
            o.Albedo = (tex2D(_mainTex, IN.uv_mainTex) * _lightMultiplier).rgb;
            o.Emission = texCUBE (_emission, IN.worldRefl).rgb;
        }
      
      ENDCG
    }
    Fallback "Diffuse"
}
