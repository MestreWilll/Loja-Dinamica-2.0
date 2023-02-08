require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmPag1E2Juntas()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setName("frmPag1E2Juntas");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.Pag1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Pag1:setParent(obj);
    obj.Pag1:setName("Pag1");
    obj.Pag1:setAlign("client");
    obj.Pag1:setVisible(false);

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.Pag1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(750);
    obj.rectangle1:setHeight(650);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(25);
    obj.rectangle1:setYradius(25);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.labSoma = GUI.fromHandle(_obj_newObject("label"));
    obj.labSoma:setParent(obj.rectangle1);
    obj.labSoma:setFontSize(28);
    obj.labSoma:setFontColor("lime");
    lfm_setPropAsString(obj.labSoma, "fontStyle",  "bold");
    obj.labSoma:setLeft(346);
    obj.labSoma:setTop(0);
    obj.labSoma:setWidth(205);
    obj.labSoma:setHeight(45);
    obj.labSoma:setName("labSoma");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.labSoma);
    obj.dataLink1:setField("Soma");
    obj.dataLink1:setName("dataLink1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setSRC("/Imagens/layoutDinheiro.png");
    obj.image1:setHitTest(true);
    obj.image1:setLeft(280);
    obj.image1:setTop(-2);
    obj.image1:setWidth(213);
    obj.image1:setHeight(56);
    obj.image1:setName("image1");

    obj.troca = GUI.fromHandle(_obj_newObject("image"));
    obj.troca:setParent(obj.rectangle1);
    obj.troca:setHitTest(true);
    obj.troca:setCursor("handPoint");
    obj.troca:setLeft(537);
    obj.troca:setTop(-2);
    obj.troca:setWidth(63);
    obj.troca:setHeight(60);
    obj.troca:setName("troca");
    obj.troca:setVisible(false);
    obj.troca:setSRC("/Imagens/vender_on.png");

    obj.posicao = GUI.fromHandle(_obj_newObject("layout"));
    obj.posicao:setParent(obj.rectangle1);
    obj.posicao:setName("posicao");
    obj.posicao:setLeft(0);
    obj.posicao:setTop(0);
    obj.posicao:setWidth(800);
    obj.posicao:setHeight(800);

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(750);
    obj.layout1:setHeight(650);
    obj.layout1:setFrameStyle("/frames/frame2.xml");
    obj.layout1:setMargins({left=10, top=10, right=10, bottom=10});
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("client");
    obj.layout2:setFrameStyle("/frames/frame1.xml");
    obj.layout2:setMargins({left=10, top=10, right=10, bottom=10});
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(30);
    obj.layout3:setMargins({bottom=4});
    obj.layout3:setName("layout3");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout3);
    obj.button1:setText("Criar Novo Item");
    obj.button1:setWidth(150);
    obj.button1:setAlign("left");
    lfm_setPropAsString(obj.button1, "fontStyle",  "bold");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setLeft(470);
    obj.button2:setWidth(50);
    obj.button2:setText("Loja");
    lfm_setPropAsString(obj.button2, "fontStyle",  "italic");
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout2);
    obj.button3:setLeft(520);
    obj.button3:setWidth(50);
    obj.button3:setText("Itens");
    lfm_setPropAsString(obj.button3, "fontStyle",  "italic");
    obj.button3:setName("button3");

    obj.rclListaDosItens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens:setParent(obj.layout2);
    obj.rclListaDosItens:setName("rclListaDosItens");
    obj.rclListaDosItens:setField("campoDosItens");
    obj.rclListaDosItens:setTemplateForm("frmItemDaLista");
    obj.rclListaDosItens:setAlign("client");
    obj.rclListaDosItens:setSelectable(true);

    obj.boxDetalhesDoItem = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.layout2);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(true);
    obj.boxDetalhesDoItem:setAlign("right");
    obj.boxDetalhesDoItem:setWidth(500);
    obj.boxDetalhesDoItem:setMargins({left=4, right=4});

    obj.LojaDinamica2 = GUI.fromHandle(_obj_newObject("image"));
    obj.LojaDinamica2:setParent(obj.boxDetalhesDoItem);
    obj.LojaDinamica2:setName("LojaDinamica2");
    obj.LojaDinamica2:setSRC("/Imagens/LojaDinamica2.png");
    obj.LojaDinamica2:setLeft(0);
    obj.LojaDinamica2:setTop(0);
    obj.LojaDinamica2:setWidth(500);
    obj.LojaDinamica2:setHeight(300);
    obj.LojaDinamica2:setVisible(false);

    obj.LojaDinamica = GUI.fromHandle(_obj_newObject("image"));
    obj.LojaDinamica:setParent(obj.boxDetalhesDoItem);
    obj.LojaDinamica:setName("LojaDinamica");
    obj.LojaDinamica:setSRC("/Imagens/LojaDinamica.png");
    obj.LojaDinamica:setLeft(0);
    obj.LojaDinamica:setTop(0);
    obj.LojaDinamica:setWidth(500);
    obj.LojaDinamica:setHeight(300);
    obj.LojaDinamica:setVisible(true);

    obj.campoTitulo = GUI.fromHandle(_obj_newObject("edit"));
    obj.campoTitulo:setParent(obj.boxDetalhesDoItem);
    obj.campoTitulo:setName("campoTitulo");
    obj.campoTitulo:setField("campoTitulo");
    obj.campoTitulo:setHorzTextAlign("center");
    obj.campoTitulo:setLeft(221.19);
    lfm_setPropAsString(obj.campoTitulo, "fontStyle",  "bold");
    obj.campoTitulo:setTop(145.56);
    obj.campoTitulo:setWidth(180);
    obj.campoTitulo:setHeight(35.44);
    obj.campoTitulo:setTransparent(true);

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.boxDetalhesDoItem);
    obj.textEditor1:setField("EdicaoItensLoja");
    obj.textEditor1:setLeft(197);
    lfm_setPropAsString(obj.textEditor1, "fontStyle",  "bold");
    obj.textEditor1:setTop(183.81);
    obj.textEditor1:setWidth(228.56);
    obj.textEditor1:setHeight(97.50);
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setName("textEditor1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.boxDetalhesDoItem);
    obj.image2:setHitTest(true);
    obj.image2:setCursor("handPoint");
    obj.image2:setLeft(439.56);
    obj.image2:setTop(0.69);
    obj.image2:setWidth(58.19);
    obj.image2:setHeight(56.69);
    obj.image2:setName("image2");

    obj.Reset = GUI.fromHandle(_obj_newObject("image"));
    obj.Reset:setParent(obj.boxDetalhesDoItem);
    obj.Reset:setName("Reset");
    obj.Reset:setLeft(439.56);
    obj.Reset:setHitTest(true);
    obj.Reset:setCursor("handPoint");
    obj.Reset:setTop(244.69);
    obj.Reset:setWidth(58.19);
    obj.Reset:setHeight(56.69);

    obj.ImagemDoProduto = GUI.fromHandle(_obj_newObject("image"));
    obj.ImagemDoProduto:setParent(obj.boxDetalhesDoItem);
    obj.ImagemDoProduto:setField("ImagemDoProduto");
    obj.ImagemDoProduto:setName("ImagemDoProduto");
    obj.ImagemDoProduto:setEditable(true);
    obj.ImagemDoProduto:setStyle("proportional");
    obj.ImagemDoProduto:setLeft(7.81);
    obj.ImagemDoProduto:setTop(80.88);
    obj.ImagemDoProduto:setWidth(174.56);
    obj.ImagemDoProduto:setHeight(149.63);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.boxDetalhesDoItem);
    obj.label1:setField("custo");
    obj.label1:setLeft(285.59);
    obj.label1:setTop(43.75);
    obj.label1:setWidth(107);
    obj.label1:setHeight(37.50);
    obj.label1:setFontSize(20);
    obj.label1:setFontColor("black");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setName("label1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.label1);
    obj.dataLink2:setField("custo");
    obj.dataLink2:setName("dataLink2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.boxDetalhesDoItem);
    obj.label2:setField("nivelItem");
    obj.label2:setHitTest(true);
    obj.label2:setFontSize(23);
    obj.label2:setFontColor("red");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setLeft(138);
    obj.label2:setTop(58);
    obj.label2:setName("label2");

    obj.colocarDinheiro2 = GUI.fromHandle(_obj_newObject("image"));
    obj.colocarDinheiro2:setParent(obj.boxDetalhesDoItem);
    obj.colocarDinheiro2:setHitTest(true);
    obj.colocarDinheiro2:setName("colocarDinheiro2");
    obj.colocarDinheiro2:setLeft(219.69);
    obj.colocarDinheiro2:setTop(35.22);
    obj.colocarDinheiro2:setWidth(60.47);
    obj.colocarDinheiro2:setHeight(52.78);

    obj.botaoDeVenda2 = GUI.fromHandle(_obj_newObject("image"));
    obj.botaoDeVenda2:setParent(obj.boxDetalhesDoItem);
    obj.botaoDeVenda2:setName("botaoDeVenda2");
    obj.botaoDeVenda2:setVisible(true);
    obj.botaoDeVenda2:setLeft(8.59);
    obj.botaoDeVenda2:setTop(241.69);
    obj.botaoDeVenda2:setWidth(58.19);
    obj.botaoDeVenda2:setHeight(56.69);
    obj.botaoDeVenda2:setOpacity(1);
    obj.botaoDeVenda2:setHitTest(true);
    obj.botaoDeVenda2:setCursor("handPoint");

    obj.Pag2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Pag2:setParent(obj);
    obj.Pag2:setName("Pag2");
    obj.Pag2:setAlign("client");
    obj.Pag2:setVisible(true);

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.Pag2);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox2);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(600);
    obj.rectangle2:setHeight(601);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(25);
    obj.rectangle2:setYradius(25);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.labSoma2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labSoma2:setParent(obj.rectangle2);
    obj.labSoma2:setFontSize(28);
    obj.labSoma2:setFontColor("lime");
    lfm_setPropAsString(obj.labSoma2, "fontStyle",  "bold");
    obj.labSoma2:setLeft(346);
    obj.labSoma2:setTop(0);
    obj.labSoma2:setWidth(205);
    obj.labSoma2:setHeight(45);
    obj.labSoma2:setField("Soma");
    obj.labSoma2:setName("labSoma2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.labSoma2);
    obj.dataLink3:setField("Soma");
    obj.dataLink3:setName("dataLink3");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle2);
    obj.image3:setSRC("/Imagens/layoutDinheiro.png");
    obj.image3:setHitTest(true);
    obj.image3:setLeft(280);
    obj.image3:setTop(-2);
    obj.image3:setWidth(213);
    obj.image3:setHeight(56);
    obj.image3:setName("image3");

    obj.troca2 = GUI.fromHandle(_obj_newObject("image"));
    obj.troca2:setParent(obj.rectangle2);
    obj.troca2:setHitTest(true);
    obj.troca2:setCursor("handPoint");
    obj.troca2:setLeft(537);
    obj.troca2:setTop(-2);
    obj.troca2:setWidth(63);
    obj.troca2:setHeight(60);
    obj.troca2:setName("troca2");
    obj.troca2:setVisible(false);
    obj.troca2:setSRC("/Imagens/vender_on.png");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle2);
    obj.layout4:setLeft(0);
    obj.layout4:setTop(0);
    obj.layout4:setWidth(600);
    obj.layout4:setHeight(600);
    obj.layout4:setFrameStyle("/frames/frame2.xml");
    obj.layout4:setMargins({left=10, top=10, right=10, bottom=10});
    obj.layout4:setName("layout4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setAlign("client");
    obj.layout5:setFrameStyle("/frames/frame1.xml");
    obj.layout5:setMargins({left=10, top=10, right=10, bottom=10});
    obj.layout5:setName("layout5");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout4);
    obj.button4:setLeft(475);
    obj.button4:setTop(8);
    obj.button4:setWidth(50);
    obj.button4:setText("Loja");
    lfm_setPropAsString(obj.button4, "fontStyle",  "italic");
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout4);
    obj.button5:setLeft(525);
    obj.button5:setTop(8);
    obj.button5:setWidth(50);
    obj.button5:setText("Itens");
    lfm_setPropAsString(obj.button5, "fontStyle",  "italic");
    obj.button5:setName("button5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout4);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(30);
    obj.layout6:setMargins({bottom=4});
    obj.layout6:setName("layout6");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout6);
    obj.button6:setText("Criar Novo Item");
    obj.button6:setWidth(150);
    obj.button6:setAlign("left");
    lfm_setPropAsString(obj.button6, "fontStyle",  "bold");
    obj.button6:setName("button6");

    obj.rclListaDosItens2 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens2:setParent(obj.layout4);
    obj.rclListaDosItens2:setName("rclListaDosItens2");
    obj.rclListaDosItens2:setField("campoDosItens2");
    obj.rclListaDosItens2:setTemplateForm("frmItemDaLista2");
    obj.rclListaDosItens2:setAlign("client");
    obj.rclListaDosItens2:setSelectable(true);

    obj.boxDetalhesDoItem2 = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem2:setParent(obj.layout4);
    obj.boxDetalhesDoItem2:setName("boxDetalhesDoItem2");
    obj.boxDetalhesDoItem2:setVisible(false);
    obj.boxDetalhesDoItem2:setAlign("right");
    obj.boxDetalhesDoItem2:setWidth(400);
    obj.boxDetalhesDoItem2:setMargins({left=4, right=4});

    obj.testeee = GUI.fromHandle(_obj_newObject("button"));
    obj.testeee:setParent(obj.boxDetalhesDoItem2);
    obj.testeee:setName("testeee");
    obj.testeee:setText("debugDin");
    obj.testeee:setLeft(200);
    obj.testeee:setTop(300);

    obj.Venda = GUI.fromHandle(_obj_newObject("image"));
    obj.Venda:setParent(obj.boxDetalhesDoItem2);
    obj.Venda:setName("Venda");
    obj.Venda:setSRC("/Imagens/vendaItens.png");
    obj.Venda:setLeft(222);
    obj.Venda:setTop(165);
    obj.Venda:setWidth(134);
    obj.Venda:setHeight(106);
    obj.Venda:setVisible(true);

    obj.naoVende = GUI.fromHandle(_obj_newObject("image"));
    obj.naoVende:setParent(obj.boxDetalhesDoItem2);
    obj.naoVende:setName("naoVende");
    obj.naoVende:setSRC("/Imagens/impossivelVende.png");
    obj.naoVende:setLeft(222);
    obj.naoVende:setTop(165);
    obj.naoVende:setWidth(134);
    obj.naoVende:setHeight(106);
    obj.naoVende:setVisible(false);

    obj.mercadoNegro = GUI.fromHandle(_obj_newObject("image"));
    obj.mercadoNegro:setParent(obj.boxDetalhesDoItem2);
    obj.mercadoNegro:setName("mercadoNegro");
    obj.mercadoNegro:setSRC("/Imagens/mercadoNegro.png");
    obj.mercadoNegro:setLeft(222);
    obj.mercadoNegro:setTop(165);
    obj.mercadoNegro:setWidth(134);
    obj.mercadoNegro:setHeight(106);
    obj.mercadoNegro:setVisible(false);

    obj.dinheiro = GUI.fromHandle(_obj_newObject("label"));
    obj.dinheiro:setParent(obj.boxDetalhesDoItem2);
    obj.dinheiro:setName("dinheiro");
    obj.dinheiro:setLeft(246);
    obj.dinheiro:setTop(183);
    obj.dinheiro:setWidth(82);
    obj.dinheiro:setHeight(26);
    obj.dinheiro:setFontSize(20);
    obj.dinheiro:setFontColor("black");
    lfm_setPropAsString(obj.dinheiro, "fontStyle",  "bold");
    obj.dinheiro:setField("custo");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.boxDetalhesDoItem2);
    obj.image4:setSRC("/Imagens/nivelDoitem.png");
    obj.image4:setLeft(180);
    obj.image4:setTop(364);
    obj.image4:setWidth(205);
    obj.image4:setHeight(30);
    obj.image4:setVisible(true);
    obj.image4:setName("image4");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.boxDetalhesDoItem2);
    obj.label3:setField("nivelItem");
    obj.label3:setHitTest(true);
    obj.label3:setFontSize(23);
    obj.label3:setFontColor("red");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setLeft(375);
    obj.label3:setTop(367);
    obj.label3:setName("label3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.boxDetalhesDoItem2);
    obj.dataLink4:setField("nivelItem");
    obj.dataLink4:setName("dataLink4");

    obj.colocarDinheiro = GUI.fromHandle(_obj_newObject("button"));
    obj.colocarDinheiro:setParent(obj.boxDetalhesDoItem2);
    obj.colocarDinheiro:setText("$");
    obj.colocarDinheiro:setName("colocarDinheiro");
    obj.colocarDinheiro:setFontColor("yellow");
    lfm_setPropAsString(obj.colocarDinheiro, "fontStyle",  "bold");
    obj.colocarDinheiro:setFontSize(25);
    obj.colocarDinheiro:setLeft(215);
    obj.colocarDinheiro:setTop(182);
    obj.colocarDinheiro:setWidth(27);
    obj.colocarDinheiro:setHeight(25);

    obj.botaoDeVenda = GUI.fromHandle(_obj_newObject("image"));
    obj.botaoDeVenda:setParent(obj.boxDetalhesDoItem2);
    obj.botaoDeVenda:setName("botaoDeVenda");
    obj.botaoDeVenda:setVisible(false);
    obj.botaoDeVenda:setSRC("/Imagens/vendeItem2.png");
    obj.botaoDeVenda:setLeft(237);
    obj.botaoDeVenda:setTop(209);
    obj.botaoDeVenda:setWidth(96);
    obj.botaoDeVenda:setOpacity(1);
    obj.botaoDeVenda:setHeight(21);
    obj.botaoDeVenda:setHitTest(true);
    obj.botaoDeVenda:setCursor("handPoint");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.boxDetalhesDoItem2);
    obj.rectangle3:setAlign("top");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setHeight(180);
    obj.rectangle3:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle3:setName("rectangle3");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle3);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(30);
    obj.layout7:setMargins({bottom=4});
    obj.layout7:setName("layout7");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout7);
    obj.label4:setAlign("left");
    obj.label4:setText("Nome do Item:");
    obj.label4:setAutoSize(true);
    obj.label4:setName("label4");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout7);
    obj.edit1:setAlign("client");
    obj.edit1:setField("campoTitulo");
    obj.edit1:setName("edit1");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle3);
    obj.label5:setText("Clique aqui para colocar imagem");
    obj.label5:setLeft(8);
    obj.label5:setTop(68);
    obj.label5:setAutoSize(true);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setWordWrap(true);
    obj.label5:setName("label5");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.rectangle3);
    obj.image5:setSRC("/Imagens/quadradoImagem.png");
    obj.image5:setLeft(0.5);
    obj.image5:setTop(33);
    obj.image5:setWidth(134);
    obj.image5:setHeight(138);
    obj.image5:setName("image5");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle3);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(131.5);
    obj.layout8:setName("layout8");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.layout8);
    obj.image6:setAlign("left");
    obj.image6:setEditable(true);
    obj.image6:setField("ImagemDoProduto");
    obj.image6:setWidth(130);
    obj.image6:setHeight(130);
    obj.image6:setMargins({top=-20});
    obj.image6:setName("image6");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setAlign("client");
    obj.layout9:setMargins({left=2});
    obj.layout9:setName("layout9");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout9);
    obj.edit2:setAlign("top");
    obj.edit2:setField("campoSubTitulo");
    obj.edit2:setHeight(30);
    obj.edit2:setName("edit2");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout9);
    obj.textEditor2:setAlign("top");
    obj.textEditor2:setField("EdicaoItensLoja");
    obj.textEditor2:setHeight(100);
    obj.textEditor2:setName("textEditor2");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle2);
    obj.textEditor3:setLeft(198);
    obj.textEditor3:setTop(250);
    obj.textEditor3:setWidth(193);
    obj.textEditor3:setHeight(347);
    obj.textEditor3:setReadOnly(true);
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setFontFamily("Meiryo UI");
    obj.textEditor3:setText("➢ (Armas)\n\n✪ (Equipáveis; Armaduras)\n\n✶ (Itens Comuns)\n\n✸ (Itens Mágicos)\n\n☌ (Poções)\n\n✉ (Livros; Pergaminhos; Cartas)\n\n♕ (Tesouros; Raros)\n\n♘ (Pet)");
    obj.textEditor3:setName("textEditor3");

    obj.DragaoDeArmadura = GUI.fromHandle(_obj_newObject("image"));
    obj.DragaoDeArmadura:setParent(obj.rectangle2);
    lfm_setPropAsString(obj.DragaoDeArmadura, "animate",  "true");
    obj.DragaoDeArmadura:setName("DragaoDeArmadura");
    obj.DragaoDeArmadura:setLeft(240);
    obj.DragaoDeArmadura:setTop(310);
    obj.DragaoDeArmadura:setWidth(405);
    obj.DragaoDeArmadura:setHeight(370);
    obj.DragaoDeArmadura:setSRC("/Gif/dragãoArmadura.gif");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.rectangle2);
    obj.image7:setSRC("/Imagens/gramaImagem.png");
    obj.image7:setLeft(175);
    obj.image7:setTop(520);
    obj.image7:setWidth(434);
    obj.image7:setHeight(79);
    obj.image7:setName("image7");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            function format_thousand(v)
            	local s = string.format("%d", math.floor(v))
            	local pos = string.len(s) % 3 
            	if pos == 0 then pos = 3 end
                return string.sub(s, 1, pos)
            	    .. "" .. string.gsub(string.sub(s, pos+1), "(...)", ".%1") 
            		.. "" .. string.sub(string.format("%.0f", v - math.floor(v)), 3) 
            
            end;
            	  self.labSoma.text = '$' .. format_thousand(sheet.soma);
        end, obj);

    obj._e_event1 = obj.image1:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                                    dialogs.inputQuery("Carteira do jogador", "Colocar dinheiro para jogador:", "",
                                       function (valorPreenchido)
                                       sheet.Soma = (sheet.Soma or 0 ) + valorPreenchido; 
                                end);
                                    end;
        end, obj);

    obj._e_event2 = obj.troca:addEventListener("onMouseEnter",
        function (_)
            self.troca.src = "/Imagens/vender_off.png"
        end, obj);

    obj._e_event3 = obj.troca:addEventListener("onMouseLeave",
        function (_)
            self.troca.src = "/Imagens/vender_on.png"
        end, obj);

    obj._e_event4 = obj.troca:addEventListener("onClick",
        function (_)
            self.fichaPrincipal.visible = true
                         self.Pag2.visible = false;
        end, obj);

    obj._e_event5 = obj.button1:addEventListener("onClick",
        function (_)
            -- Usuário clicou no botão de criar novo item.
                                            -- Vamos inserir um novo item no nosso recordList                              
                                            self.rclListaDosItens:append();
        end, obj);

    obj._e_event6 = obj.button2:addEventListener("onClick",
        function (_)
            ----Aqui fica pra ir pra loja
                           self.Pag1.visible = true;
                           self.Pag2.visible = false;
        end, obj);

    obj._e_event7 = obj.button3:addEventListener("onClick",
        function (_)
            --------aqui fica pra ir pros itens 
                                 self.Pag1.visible = false;
                                 self.Pag2.visible = true;
        end, obj);

    obj._e_event8 = obj.rclListaDosItens:addEventListener("onSelect",
        function (_)
            local node = self.rclListaDosItens.selectedNode;  
                                     self.boxDetalhesDoItem.node = node;      
            						 
                              -- a caixa de detalhe só ficará visível se houver item selecionado
                                      self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    obj._e_event9 = obj.image2:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                            ndb.deleteNode(self.boxDetalhesDoItem.node);
                            else
                            showMessage("Você não tem permissão");
                            end;
        end, obj);

    obj._e_event10 = obj.Reset:addEventListener("onClick",
        function (_)
            self.boxDetalhesDoItem.node.custo = (sheet.custo or 0) + 0;
                    self.boxDetalhesDoItem.node.nivelItem = 0;
                    self.boxDetalhesDoItem.node.EdicaoItensLoja = '';
                    self.boxDetalhesDoItem.node.campoTitulo = '';
                    self.boxDetalhesDoItem.node.ImagemDoProduto = '';
        end, obj);

    obj._e_event11 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            function format_thousand(v)
                local s = string.format("%d", math.floor(v))
                local pos = string.len(s) % 3 
                if pos == 0 then pos = 3 end
            return string.sub(s, 1, pos)
                    .. "" .. string.gsub(string.sub(s, pos+1), "(...)", ".%1") 
                        .. "" .. string.sub(string.format("%.0f", v - math.floor(v)), 3) 
            
            end;
            self.labcusto.text = '$' .. format_thousand(sheet.custo);
        end, obj);

    obj._e_event12 = obj.label2:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel do item", "Level:", "",
            		   function (valorPreenchido)
            		      self.boxDetalhesDoItem.node.nivelItem = (sheet.nivelItem or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event13 = obj.colocarDinheiro2:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                                    dialogs.inputQuery("Caixa", "Quantidades:", "",
                                    function (valorPreenchido)
                                    self.boxDetalhesDoItem.node.custo = (sheet.custo or 0) + valorPreenchido; 
                            end);
                                    end;
        end, obj);

    obj._e_event14 = obj.botaoDeVenda2:addEventListener("onClick",
        function (_)
            local boxDetalhesDoItem2
                              local custo = tonumber(sheet.custo) or 0;
                              local Soma = tonumber(sheet.Soma) or 0;
                              if Soma >= self.boxDetalhesDoItem.node.custo then
                        
                                 sheet.Soma = Soma - self.boxDetalhesDoItem.node.custo;
                                 self.boxDetalhesDoItem2.node.campoTitulo = self.boxDetalhesDoItem.node.campoTitulo
                                 self.boxDetalhesDoItem2.node.nivelItem = self.boxDetalhesDoItem.node.nivelItem
                                 self.boxDetalhesDoItem2.node.ImagemDoProduto = self.boxDetalhesDoItem.node.ImagemDoProduto
                                 self.boxDetalhesDoItem2.node.EdicaoItensLoja = self.boxDetalhesDoItem.node.EdicaoItensLoja
                                 self.boxDetalhesDoItem2.node.EdicaoItensLoja = self.boxDetalhesDoItem.node.EdicaoItensLoja
                                 self.boxDetalhesDoItem2.node.custo = self.boxDetalhesDoItem.node.custo
                                 self.boxDetalhesDoItem2.node.campoSubTitulo = '(Descrição adicional)'
                                 boxDetalhesDoItem = ndb.deleteNode(self.boxDetalhesDoItem.node);
                              else
                                 showMessage("Você não tem mais dinheiro");
                              end;
        end, obj);

    obj._e_event15 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            function format_thousand(v)
             local s = string.format("%d", math.floor(v))
             local pos = string.len(s) % 3 
             if pos == 0 then pos = 3 end
             return string.sub(s, 1, pos)
                 .. "" .. string.gsub(string.sub(s, pos+1), "(...)", ".%1") 
                 .. "" .. string.sub(string.format("%.0f", v - math.floor(v)), 3) 
            
            end;
               self.labSoma2.text = '$' .. format_thousand(sheet.soma);
        end, obj);

    obj._e_event16 = obj.image3:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                                     dialogs.inputQuery("Carteira do jogador", "Colocar dinheiro para jogador:", "",
                                        function (valorPreenchido)
                                        sheet.Soma = (sheet.Soma or 0 ) + valorPreenchido; 
                                 end);
                                     end;
        end, obj);

    obj._e_event17 = obj.troca2:addEventListener("onMouseEnter",
        function (_)
            self.troca.src = "/Imagens/vender_off.png"
        end, obj);

    obj._e_event18 = obj.troca2:addEventListener("onMouseLeave",
        function (_)
            self.troca.src = "/Imagens/vender_on.png"
        end, obj);

    obj._e_event19 = obj.troca2:addEventListener("onClick",
        function (_)
            self.fichaPrincipal.visible = true
                          self.Pag2.visible = false;
        end, obj);

    obj._e_event20 = obj.button4:addEventListener("onClick",
        function (_)
            ----Aqui fica pra ir pra loja
                        self.Pag1.visible = true;
                        self.Pag2.visible = false;
        end, obj);

    obj._e_event21 = obj.button5:addEventListener("onClick",
        function (_)
            --------aqui fica pra ir pros itens 
                              self.Pag1.visible = false;
                              self.Pag2.visible = true;
        end, obj);

    obj._e_event22 = obj.button6:addEventListener("onClick",
        function (_)
            -- Usuário clicou no botão de criar novo item.
                                             -- Vamos inserir um novo item no nosso recordList                              
                                             self.rclListaDosItens2:append();
        end, obj);

    obj._e_event23 = obj.rclListaDosItens2:addEventListener("onSelect",
        function (_)
            local node = self.rclListaDosItens2.selectedNode;  
                                      self.boxDetalhesDoItem2.node = node;      
                                
                               -- a caixa de detalhe só ficará visível se houver item selecionado
                                       self.boxDetalhesDoItem2.visible = (node ~= nil);
        end, obj);

    obj._e_event24 = obj.testeee:addEventListener("onClick",
        function (_)
            self.boxDetalhesDoItem2.node.custo = (sheet.custo or 0) + 0;
                     self.boxDetalhesDoItem2.node.nivelItem = 0;
        end, obj);

    obj._e_event25 = obj.label3:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                   dialogs.inputQuery("Nivel do item", "Level:", "",
                      function (valorPreenchido)
                         self.boxDetalhesDoItem2.node.nivelItem = (sheet.nivelItem or 0) + valorPreenchido; 
                    end);
                   end;
        end, obj);

    obj._e_event26 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if self.boxDetalhesDoItem2.node.nivelItem == 0 then
                 self.Venda.visible = false;
                 self.botaoDeVenda.visible = false;
                 self.colocarDinheiro.visible = false;
                 self.naoVende.visible = true;
                 self.dinheiro.visible = false;
                end;
               if self.boxDetalhesDoItem2.node.nivelItem == 1 then
               self.mercadoNegro.visible = false;
               self.naoVende.visible = false;
                   self.botaoDeVenda.visible = true;
                 self.Venda.visible = true;
                 self.botaoDeVenda.visible = true;
                 self.colocarDinheiro.visible = true;
                 self.dinheiro.visible = true;
              end;
               if self.boxDetalhesDoItem2.node.nivelItem == 2 then
               self.mercadoNegro.visible = false;
               self.naoVende.visible = false;
                   self.botaoDeVenda.visible = true;
                 self.Venda.visible = true;
                 self.botaoDeVenda.visible = true;
                 self.colocarDinheiro.visible = true;
                 self.dinheiro.visible = true;
              end;
               if self.boxDetalhesDoItem2.node.nivelItem == 3 then
               self.mercadoNegro.visible = true;
                   self.botaoDeVenda.visible = false;
                 self.Venda.visible = false;
                 self.botaoDeVenda.visible = false;
                 self.colocarDinheiro.visible = false;
                 self.dinheiro.visible = false;
             
               end;
        end, obj);

    obj._e_event27 = obj.colocarDinheiro:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                   dialogs.inputQuery("Caixa", "Quantidades:", "",
                      function (valorPreenchido)
                         self.boxDetalhesDoItem2.node.custo = (sheet.custo or 0) + valorPreenchido; 
                    end);
                   end;
        end, obj);

    obj._e_event28 = obj.botaoDeVenda:addEventListener("onClick",
        function (_)
            local custo = tonumber(sheet.custo) or 0;
                 local Soma = tonumber(sheet.Soma) or 0;
                 sheet.Soma = Soma + self.boxDetalhesDoItem2.node.custo; 
                 custo = ndb.deleteNode(self.boxDetalhesDoItem2.node);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.naoVende ~= nil then self.naoVende:destroy(); self.naoVende = nil; end;
        if self.LojaDinamica ~= nil then self.LojaDinamica:destroy(); self.LojaDinamica = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.troca ~= nil then self.troca:destroy(); self.troca = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.botaoDeVenda ~= nil then self.botaoDeVenda:destroy(); self.botaoDeVenda = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.troca2 ~= nil then self.troca2:destroy(); self.troca2 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rclListaDosItens2 ~= nil then self.rclListaDosItens2:destroy(); self.rclListaDosItens2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.ImagemDoProduto ~= nil then self.ImagemDoProduto:destroy(); self.ImagemDoProduto = nil; end;
        if self.colocarDinheiro ~= nil then self.colocarDinheiro:destroy(); self.colocarDinheiro = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.mercadoNegro ~= nil then self.mercadoNegro:destroy(); self.mercadoNegro = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.boxDetalhesDoItem2 ~= nil then self.boxDetalhesDoItem2:destroy(); self.boxDetalhesDoItem2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rclListaDosItens ~= nil then self.rclListaDosItens:destroy(); self.rclListaDosItens = nil; end;
        if self.DragaoDeArmadura ~= nil then self.DragaoDeArmadura:destroy(); self.DragaoDeArmadura = nil; end;
        if self.Reset ~= nil then self.Reset:destroy(); self.Reset = nil; end;
        if self.botaoDeVenda2 ~= nil then self.botaoDeVenda2:destroy(); self.botaoDeVenda2 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.testeee ~= nil then self.testeee:destroy(); self.testeee = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.campoTitulo ~= nil then self.campoTitulo:destroy(); self.campoTitulo = nil; end;
        if self.Pag2 ~= nil then self.Pag2:destroy(); self.Pag2 = nil; end;
        if self.labSoma2 ~= nil then self.labSoma2:destroy(); self.labSoma2 = nil; end;
        if self.posicao ~= nil then self.posicao:destroy(); self.posicao = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.Pag1 ~= nil then self.Pag1:destroy(); self.Pag1 = nil; end;
        if self.labSoma ~= nil then self.labSoma:destroy(); self.labSoma = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.Venda ~= nil then self.Venda:destroy(); self.Venda = nil; end;
        if self.colocarDinheiro2 ~= nil then self.colocarDinheiro2:destroy(); self.colocarDinheiro2 = nil; end;
        if self.dinheiro ~= nil then self.dinheiro:destroy(); self.dinheiro = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.LojaDinamica2 ~= nil then self.LojaDinamica2:destroy(); self.LojaDinamica2 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmPag1E2Juntas()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmPag1E2Juntas();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmPag1E2Juntas = {
    newEditor = newfrmPag1E2Juntas, 
    new = newfrmPag1E2Juntas, 
    name = "frmPag1E2Juntas", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmPag1E2Juntas = _frmPag1E2Juntas;
Firecast.registrarForm(_frmPag1E2Juntas);

return _frmPag1E2Juntas;
