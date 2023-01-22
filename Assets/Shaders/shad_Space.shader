Shader "Custom/Space"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _BaseColor ("Base Color", Color) = (1,1,1,1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        HLSLINCLUDE
        
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

        CBUFFER_START(UnityPerMaterial)
            float4 _BaseColor;
        CBUFFER_END

        TEXTURE2D(_MainTex);
        SAMPLER(sampler_MainTex);

        struct appData
        {
            float2 uv : TEXCOORD0;
        };

        struct v2f
        {
            float2 uv : TEXCOORD0;
        };

        ENDHLSL

        Pass
        {
           HLSLPROGRAM
           #pragma vertex vert
           #pragma fragment frag


           v2f vert(appData i)
           {
               v2f o;
               o.uv = i.uv;
               return o;
           }

           float4 frag(v2f i) : SV_Target
           {
               return _BaseColor;
               //return(SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, i.uv));
           }

           ENDHLSL
        }
    }
}
