require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmLojaDinamica()
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
    obj:setName("frmLojaDinamica");
    obj:setAlign("client");

    obj.Pag1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Pag1:setParent(obj);
    obj.Pag1:setName("Pag1");
    obj.Pag1:setAlign("client");
    obj.Pag1:setVisible(true);

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

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.boxDetalhesDoItem);
    obj.image2:setSRC("/Imagens/LojaDinamica.png");
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(500);
    obj.image2:setHeight(300);
    obj.image2:setName("image2");

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

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.boxDetalhesDoItem);
    obj.image3:setHitTest(true);
    obj.image3:setCursor("handPoint");
    obj.image3:setLeft(439.56);
    obj.image3:setTop(0.69);
    obj.image3:setWidth(58.19);
    obj.image3:setHeight(56.69);
    obj.image3:setName("image3");

    obj.Reset = GUI.fromHandle(_obj_newObject("image"));
    obj.Reset:setParent(obj.boxDetalhesDoItem);
    obj.Reset:setName("Reset");
    obj.Reset:setLeft(439.56);
    obj.Reset:setHitTest(true);
    obj.Reset:setCursor("handPoint");
    obj.Reset:setTop(244.69);
    obj.Reset:setWidth(58.19);
    obj.Reset:setHeight(56.69);

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.boxDetalhesDoItem);
    obj.image4:setField("ImagemDoProduto");
    obj.image4:setEditable(true);
    obj.image4:setStyle("proportional");
    obj.image4:setLeft(7.81);
    obj.image4:setTop(80.88);
    obj.image4:setWidth(174.56);
    obj.image4:setHeight(149.63);
    obj.image4:setName("image4");

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

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.boxDetalhesDoItem);
    obj.dataLink3:setField("nivelItem");
    obj.dataLink3:setName("dataLink3");

    obj.colocarDinheiro = GUI.fromHandle(_obj_newObject("image"));
    obj.colocarDinheiro:setParent(obj.boxDetalhesDoItem);
    obj.colocarDinheiro:setHitTest(true);
    obj.colocarDinheiro:setName("colocarDinheiro");
    obj.colocarDinheiro:setLeft(219.69);
    obj.colocarDinheiro:setTop(35.22);
    obj.colocarDinheiro:setWidth(60.47);
    obj.colocarDinheiro:setHeight(52.78);

    obj.botaoDeVenda = GUI.fromHandle(_obj_newObject("image"));
    obj.botaoDeVenda:setParent(obj.boxDetalhesDoItem);
    obj.botaoDeVenda:setName("botaoDeVenda");
    obj.botaoDeVenda:setVisible(true);
    obj.botaoDeVenda:setLeft(8.59);
    obj.botaoDeVenda:setTop(241.69);
    obj.botaoDeVenda:setWidth(58.19);
    obj.botaoDeVenda:setHeight(56.69);
    obj.botaoDeVenda:setOpacity(1);
    obj.botaoDeVenda:setHitTest(true);
    obj.botaoDeVenda:setCursor("handPoint");

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

    obj._e_event6 = obj.rclListaDosItens:addEventListener("onSelect",
        function (_)
            local node = self.rclListaDosItens.selectedNode;  
                                     self.boxDetalhesDoItem.node = node;      
            						 
                              -- a caixa de detalhe só ficará visível se houver item selecionado
                                      self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    obj._e_event7 = obj.image3:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                            ndb.deleteNode(self.boxDetalhesDoItem.node);
                            else
                            showMessage("Você não tem permissão");
                            end;
        end, obj);

    obj._e_event8 = obj.Reset:addEventListener("onClick",
        function (_)
            self.boxDetalhesDoItem.node.custo = (sheet.custo or 0) + 0;
                    self.boxDetalhesDoItem.node.nivelItem = 0;
        end, obj);

    obj._e_event9 = obj.dataLink2:addEventListener("onChange",
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

    obj._e_event10 = obj.label2:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel do item", "Level:", "",
            		   function (valorPreenchido)
            		      self.boxDetalhesDoItem.node.nivelItem = (sheet.nivelItem or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event11 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if self.boxDetalhesDoItem.node.nivelItem == 0 then
                self.Venda.visible = false;
                self.botaoDeVenda.visible = false;
                self.colocarDinheiro.visible = false;
                self.naoVende.visible = true;
                self.dinheiro.visible = false;
               end;
              if self.boxDetalhesDoItem.node.nivelItem == 1 then
              self.mercadoNegro.visible = false;
              self.naoVende.visible = false;
                  self.botaoDeVenda.visible = true;
                self.Venda.visible = true;
                self.botaoDeVenda.visible = true;
                self.colocarDinheiro.visible = true;
                self.dinheiro.visible = true;
             end;
              if self.boxDetalhesDoItem.node.nivelItem == 2 then
              self.mercadoNegro.visible = false;
              self.naoVende.visible = false;
                  self.botaoDeVenda.visible = true;
                self.Venda.visible = true;
                self.botaoDeVenda.visible = true;
                self.colocarDinheiro.visible = true;
                self.dinheiro.visible = true;
             end;
              if self.boxDetalhesDoItem.node.nivelItem == 3 then
              self.mercadoNegro.visible = true;
                  self.botaoDeVenda.visible = false;
                self.Venda.visible = false;
                self.botaoDeVenda.visible = false;
                self.colocarDinheiro.visible = false;
                self.dinheiro.visible = false;
            
              end;
        end, obj);

    obj._e_event12 = obj.colocarDinheiro:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                                    dialogs.inputQuery("Caixa", "Quantidades:", "",
                                    function (valorPreenchido)
                                    self.boxDetalhesDoItem.node.custo = (sheet.custo or 0) + valorPreenchido; 
                            end);
                                    end;
        end, obj);

    obj._e_event13 = obj.botaoDeVenda:addEventListener("onClick",
        function (_)
            local custo = tonumber(sheet.custo) or 0;
                              local Soma = tonumber(sheet.Soma) or 0;
                              if Soma >= self.boxDetalhesDoItem.node.custo then
                                 sheet.Soma = Soma - self.boxDetalhesDoItem.node.custo;
                              else
                                 showMessage("Você não tem mais dinheiro");
                              end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.Reset ~= nil then self.Reset:destroy(); self.Reset = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.campoTitulo ~= nil then self.campoTitulo:destroy(); self.campoTitulo = nil; end;
        if self.posicao ~= nil then self.posicao:destroy(); self.posicao = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.Pag1 ~= nil then self.Pag1:destroy(); self.Pag1 = nil; end;
        if self.labSoma ~= nil then self.labSoma:destroy(); self.labSoma = nil; end;
        if self.troca ~= nil then self.troca:destroy(); self.troca = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.botaoDeVenda ~= nil then self.botaoDeVenda:destroy(); self.botaoDeVenda = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.colocarDinheiro ~= nil then self.colocarDinheiro:destroy(); self.colocarDinheiro = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rclListaDosItens ~= nil then self.rclListaDosItens:destroy(); self.rclListaDosItens = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmLojaDinamica()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmLojaDinamica();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmLojaDinamica = {
    newEditor = newfrmLojaDinamica, 
    new = newfrmLojaDinamica, 
    name = "frmLojaDinamica", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmLojaDinamica = _frmLojaDinamica;
Firecast.registrarForm(_frmLojaDinamica);

return _frmLojaDinamica;
