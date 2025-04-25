 precision mediump float;
 uniform vec2  m;       // mouse
 uniform float t;       // time
 uniform vec2  r;       // resolution
 uniform sampler2D smp; // prev scene
 
 void main(void){
  vec2 scale = vec2(1.0, 1.7);
  vec2 p = (gl_FragCoord.xy * 2.0 - r) / min(r.x, r.y); // 正規化
  float something = fract(sin(dot(p, vec2(2.9,6.2))) * 5558.5);
  float speed = 1.0;

  float l = length(p*scale);
  l = step(0.75,l)*step(l,0.8);
  
  float displacement = sin(t * speed+something) * 0.1;
  vec2 movingPos = vec2(displacement, 0.0);
  
  
  // 内部円（ll）の動き
  float ll = length(p - movingPos);
  ll = step(0.45, ll) * step(ll, 0.47);
  
  float displacement2 = cos(t*speed+something) * 0.1;
  vec2 movingPos2 = vec2(displacement2, 0.0);
  
  float lll = length(p - movingPos2);
  lll = step(0.1, lll) * step(lll, 0.2);
  
  float Limit = length(p*scale);
  Limit = step(Limit,0.8);
  
  vec3 test = vec3(100,19,45);
  
  gl_FragColor = vec4(vec3(((l+ll+lll)*something * Limit * (test *0.6)) - 2.), 1.0);
 }
