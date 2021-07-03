const draw = ({ gl, program, buffer }) => {
  gl.clearColor(0.0, 0.0, 0.0, 1.0);
  gl.clearDepth(1.0);
  gl.enable(gl.DEPTH_TEST);
  gl.depthFunc(gl.LEQUAL);

  gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);

  const vPos = gl.getAttribLocation(program, "vPos");
  gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
  gl.vertexAttribPointer(vPos, 4, gl.FLOAT, false, 32, 0);
  gl.enableVertexAttribArray(vPos);

  const vColor = gl.getAttribLocation(program, "vColor");
  gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
  gl.vertexAttribPointer(vColor, 4, gl.FLOAT, false, 32, 16);
  gl.enableVertexAttribArray(vColor);

  gl.useProgram(program);

  gl.drawArrays(gl.TRIANGLES, 0, 6);
};

const getBuffer = (gl) => {
  const buffer = gl.createBuffer();

  gl.bindBuffer(gl.ARRAY_BUFFER, buffer);

  const vertices = new Float32Array(
    [
      [-1.0, -1.0, 0.0, 1.0],
      [1.0, 0.0, 0.0, 1.0],
      [1.0, 1.0, 0.0, 1.0],
      [0.0, 1.0, 0.0, 1.0],
      [1.0, -1.0, 0.0, 1.0],
      [0.0, 0.0, 1.0, 1.0],
      [-1.0, -1.0, 0.0, 1.0],
      [1.0, 0.0, 0.0, 1.0],
      [1.0, 1.0, 0.0, 1.0],
      [0.0, 1.0, 0.0, 1.0],
      [-1.0, 1.0, 0.0, 1.0],
      [1.0, 1.0, 1.0, 1.0],
    ].flat()
  );

  gl.bufferData(gl.ARRAY_BUFFER, vertices, gl.STATIC_DRAW);

  return buffer;
};

const getShader = ({ gl, source, type }) => {
  const shader = gl.createShader(type);
  gl.shaderSource(shader, source);
  gl.compileShader(shader);

  if (!gl.getShaderParameter(shader, gl.COMPILE_STATUS)) {
    console.error(gl.getShaderInfoLog(shader));
    gl.deleteShader(shader);
    return null;
  }

  return shader;
};

const getProgram = ({ gl, vertexShaderSource, fragmentShaderSource }) => {
  const program = gl.createProgram();
  gl.attachShader(
    program,
    getShader({ gl, source: vertexShaderSource, type: gl.VERTEX_SHADER })
  );
  gl.attachShader(
    program,
    getShader({ gl, source: fragmentShaderSource, type: gl.FRAGMENT_SHADER })
  );
  gl.linkProgram(program);

  if (!gl.getProgramParameter(program, gl.LINK_STATUS)) {
    console.error(gl.getProgramInfoLog(program));
    return null;
  }

  return program;
};

const main = () => {
  const canvas = document.getElementById("canvas");
  canvas.width = 512;
  canvas.height = 512;

  const gl = canvas.getContext("webgl");

  if (!gl) {
    return;
  }

  const vertexShaderSource = `
    attribute vec4 vPos;
    attribute vec4 vColor;

    varying lowp vec4 fColor;

    void main() {
      fColor = vColor;
      gl_Position = vPos;
    }`;

  const fragmentShaderSource = `
    varying lowp vec4 fColor;

    void main() {
      gl_FragColor = fColor;
      //gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
    }`;

  const program = getProgram({ gl, vertexShaderSource, fragmentShaderSource });

  const buffer = getBuffer(gl);

  draw({ gl, program, buffer });
};

window.onload = main;
