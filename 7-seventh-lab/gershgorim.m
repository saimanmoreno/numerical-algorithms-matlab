A =[5 1 -1; 0 6 1; 1 0 -5];
figure(1)
alfa=0:.01:2*pi;
fill(4+16*cos(alfa),16*sin(alfa),'c')
hold on
axis equal
fill(6+cos(alfa),sin(alfa),'c')
fill(-5+cos(alfa),sin(alfa),'c')
z=eig(A);z=z+eps*i;
plot(z,'o','MarkerSize',6)