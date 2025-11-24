T = 1
amp = 0.5

clf; 
ylim([-0.7 0.7])
xlim([0 2])
set(gcf, 'Color', 'w'); 
set(gca, 'XColor', 'k', 'YColor', 'k'); 
set(gca, 'Color', 'w'); 
hold on
x = 0:0.001:4*pi; 

% square wave
y_square = amp * square(2 * pi * x / T); 
hold on;             
plot(x, y_square);   

function y_sum = fourier_approx(k, x, amp, T)
    y_sum = zeros(size(x)); 
    for i = 1:2:k 
        a_i = 4 * amp/(i * pi)
        y_n =  a_i * sin(2 * pi * x * i / T);
        y_sum = y_sum + y_n;
    end
end

y_3 = fourier_approx(3, x, amp, T)
y_29 = fourier_approx(29, x, amp, T)

plot(x, y_3);
hold on 
plot(x, y_29, "r")
legend('Square Wave', 'k=3', 'k=29', 'Location', 'Best');

hold off
