varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float uniform_val;
void main()
{	
	gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	gl_FragColor.a = gl_FragColor.a * uniform_val;
	gl_FragColor = vec4(1.0, 1.0, 1.0, gl_FragColor.a);
}