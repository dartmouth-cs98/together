/// @description Graph that represents NPC-walkable areas. Controls where they can move.

node_list = ds_list_create();
edge_list = ds_list_create();

#region Node setup: 3 x 3 grid
/*
// Column 1
n11 = instance_create_layer(100, 100, "Instances", con_npc_graph_node);
n12 = instance_create_layer(100, 200, "Instances", con_npc_graph_node);
n13 = instance_create_layer(100, 300, "Instances", con_npc_graph_node);

// Column 2
n21 = instance_create_layer(200, 100, "Instances", con_npc_graph_node);
n22 = instance_create_layer(200, 200, "Instances", con_npc_graph_node);
n23 = instance_create_layer(200, 300, "Instances", con_npc_graph_node);

// Column 3
n31 = instance_create_layer(300, 100, "Instances", con_npc_graph_node);
n32 = instance_create_layer(300, 200, "Instances", con_npc_graph_node);
n33 = instance_create_layer(300, 300, "Instances", con_npc_graph_node);

ds_list_add(	node_list,
				n11, n12, n13,
				n21, n22, n23,
				n31, n32, n33);

// Add neigbors

// Column 1
ds_list_add(n11.neighbors, n12, n21);
ds_list_add(n12.neighbors, n11, n22, n13);
ds_list_add(n13.neighbors, n12, n23);

// Column 2
ds_list_add(n21.neighbors, n11, n22, n31);
ds_list_add(n22.neighbors, n21, n12, n23, n32);
ds_list_add(n23.neighbors, n13, n22, n33);

// Column 3
ds_list_add(n31.neighbors, n21, n32);
ds_list_add(n32.neighbors, n31, n22, n33);
ds_list_add(n33.neighbors, n32, n23);
*/
#endregion



#region Node setup: city

#region Create nodes
A = instance_create_layer(340,		185,	"Instances", con_npc_graph_node);
B = instance_create_layer(670,		185,	"Instances", con_npc_graph_node);
C = instance_create_layer(1000,		185,	"Instances", con_npc_graph_node);
D = instance_create_layer(1000,		260,	"Instances", con_npc_graph_node);
E = instance_create_layer(1280,		260,	"Instances", con_npc_graph_node);
F = instance_create_layer(1675,		196,	"Instances", con_npc_graph_node);
G = instance_create_layer(340,		430,	"Instances", con_npc_graph_node);
H = instance_create_layer(670,		430,	"Instances", con_npc_graph_node);
I = instance_create_layer(1000,		430,	"Instances", con_npc_graph_node);
J = instance_create_layer(365,		625,	"Instances", con_npc_graph_node);
K = instance_create_layer(515,		625,	"Instances", con_npc_graph_node);
L = instance_create_layer(670,		625,	"Instances", con_npc_graph_node);
M = instance_create_layer(1000,		625,	"Instances", con_npc_graph_node);
N = instance_create_layer(1280,		625,	"Instances", con_npc_graph_node);
O = instance_create_layer(1675,		650,	"Instances", con_npc_graph_node);
P = instance_create_layer(1870,		650,	"Instances", con_npc_graph_node);
Q = instance_create_layer(515,		890,	"Instances", con_npc_graph_node);
R = instance_create_layer(1280,		850,	"Instances", con_npc_graph_node);
S = instance_create_layer(1675,		850,	"Instances", con_npc_graph_node);
T = instance_create_layer(1870,		850,	"Instances", con_npc_graph_node);
U = instance_create_layer(2040,		850,	"Instances", con_npc_graph_node);
V = instance_create_layer(460,		1000,	"Instances", con_npc_graph_node);
W = instance_create_layer(355,		1045,	"Instances", con_npc_graph_node);
X = instance_create_layer(355,		1145,	"Instances", con_npc_graph_node);
#endregion

#region Add nodes to list
ds_list_add(node_list,	A, B, C,
						D, E, F,
						G, H, I,
						J, K, L,
						M, N, O);

ds_list_add(node_list,	P, Q, R,
						S, T, U,
						V, W, X);
#endregion

#region Set up neighbors & edges

ds_list_add(A.neighbors, B);
ds_list_add(A.neighbors, G);
ds_list_add(edge_list, [A, B]);
ds_list_add(edge_list, [A, G]);

ds_list_add(B.neighbors, A);
ds_list_add(B.neighbors, H);
ds_list_add(B.neighbors, C);
ds_list_add(edge_list, [B, A]);
ds_list_add(edge_list, [B, H]);
ds_list_add(edge_list, [B, C]);

ds_list_add(C.neighbors, B);
ds_list_add(C.neighbors, D);
ds_list_add(edge_list, [C, B]);
ds_list_add(edge_list, [C, D]);

ds_list_add(D.neighbors, C);
ds_list_add(D.neighbors, E);
ds_list_add(D.neighbors, I);
ds_list_add(edge_list, [D, C]);
ds_list_add(edge_list, [D, E]);
ds_list_add(edge_list, [D, I]);

ds_list_add(E.neighbors, D);
ds_list_add(E.neighbors, N);
ds_list_add(edge_list, [E, D]);
ds_list_add(edge_list, [E, N]);

ds_list_add(F.neighbors, O);
ds_list_add(edge_list, [F, O]);

ds_list_add(G.neighbors, A);
ds_list_add(G.neighbors, H);
ds_list_add(edge_list, [G, A]);
ds_list_add(edge_list, [G, H]);

ds_list_add(H.neighbors, I);
ds_list_add(H.neighbors, B);
ds_list_add(H.neighbors, G);
ds_list_add(H.neighbors, L);
ds_list_add(edge_list, [H, I]);
ds_list_add(edge_list, [H, B]);
ds_list_add(edge_list, [H, G]);
ds_list_add(edge_list, [H, L]);

ds_list_add(I.neighbors, H);
ds_list_add(I.neighbors, D);
ds_list_add(I.neighbors, M);
ds_list_add(edge_list, [I, H]);
ds_list_add(edge_list, [I, D]);
ds_list_add(edge_list, [I, M]);

ds_list_add(J.neighbors, K);
ds_list_add(edge_list, [J, K]);

ds_list_add(K.neighbors, Q);
ds_list_add(K.neighbors, J);
ds_list_add(K.neighbors, L);
ds_list_add(edge_list, [K, Q]);
ds_list_add(edge_list, [K, J]);
ds_list_add(edge_list, [K, L]);

ds_list_add(L.neighbors, K);
ds_list_add(L.neighbors, H);
ds_list_add(L.neighbors, M);
ds_list_add(edge_list, [L, K]);
ds_list_add(edge_list, [L, H]);
ds_list_add(edge_list, [L, M]);

ds_list_add(M.neighbors, L);
ds_list_add(M.neighbors, I);
ds_list_add(M.neighbors, N);
ds_list_add(edge_list, [M, L]);
ds_list_add(edge_list, [M, I]);
ds_list_add(edge_list, [M, N]);

ds_list_add(N.neighbors, M);
ds_list_add(N.neighbors, E);
ds_list_add(N.neighbors, R);
ds_list_add(edge_list, [N, M]);
ds_list_add(edge_list, [N, E]);
ds_list_add(edge_list, [N, R]);

ds_list_add(O.neighbors, F);
ds_list_add(O.neighbors, P);
ds_list_add(O.neighbors, S);
ds_list_add(edge_list, [O, F]);
ds_list_add(edge_list, [O, P]);
ds_list_add(edge_list, [O, S]);

ds_list_add(P.neighbors, O);
ds_list_add(P.neighbors, T);
ds_list_add(edge_list, [P, O]);
ds_list_add(edge_list, [P, T]);

ds_list_add(Q.neighbors, K);
ds_list_add(Q.neighbors, V);
ds_list_add(edge_list, [Q, K]);
ds_list_add(edge_list, [Q, V]);

ds_list_add(R.neighbors, N);
ds_list_add(R.neighbors, S);
ds_list_add(edge_list, [R, N]);
ds_list_add(edge_list, [R, S]);

ds_list_add(S.neighbors, R);
ds_list_add(S.neighbors, O);
ds_list_add(S.neighbors, T);
ds_list_add(edge_list, [S, R]);
ds_list_add(edge_list, [S, O]);
ds_list_add(edge_list, [S, T]);

ds_list_add(T.neighbors, S);
ds_list_add(T.neighbors, P);
ds_list_add(T.neighbors, U);
ds_list_add(edge_list, [T, S]);
ds_list_add(edge_list, [T, P]);
ds_list_add(edge_list, [T, U]);

ds_list_add(U.neighbors, T);
ds_list_add(edge_list, [U, T]);

ds_list_add(V.neighbors, Q);
ds_list_add(V.neighbors, W);
ds_list_add(edge_list, [V, Q]);
ds_list_add(edge_list, [V, W]);

ds_list_add(W.neighbors, V);
ds_list_add(W.neighbors, X);
ds_list_add(edge_list, [W, V]);
ds_list_add(edge_list, [W, X]);

ds_list_add(X.neighbors, W);
ds_list_add(edge_list, [X, W]);

#endregion

#endregion