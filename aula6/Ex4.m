clear
close

N = 100;

LA = 4;
LB = 3;
LC = 3;
LD = 0.1;

Qi = [0 0 0 0 0]';
QA = [pi/2 0 -pi/4 2 pi/6]';

DH = [
      0   0  LA  pi
      0  LB   0   0   % virtual joint
      0  LC   0   0
      0   0   0   0
      0  LD   0   0
];

MQ = [LinspaceVect(Qi, QA, 100), LinspaceVect(QA, Qi, 100)];
MDH = GenerateMultiDH(DH,MQ,[0 0 0 1 0]);
AAA = CalculateRobotMotion(MDH);

[P, F] = seixos3(0.5);

hold on;
grid on;
axis([-2 8 -2 8 0 4]);
view(60, 30);

AA = Tlinks(DH);
Org = LinkOrigins(AA);
h = DrawLinks(Org);
H = DrawFrames(AA, P, F);

% animate
while 1
    AnimateRobot(H, AAA, P, h, 0.01);
end