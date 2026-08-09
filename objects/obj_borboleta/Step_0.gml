
image_xscale = lerp(image_xscale, escala_alvo_x, velocidade_suave);
image_yscale = lerp(image_yscale, escala_alvo_y, velocidade_suave);

if (abs(image_xscale - 1) < 0.001) image_xscale = 1;
if (abs(image_yscale - 1) < 0.001) image_yscale = 1;