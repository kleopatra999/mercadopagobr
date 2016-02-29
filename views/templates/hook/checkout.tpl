{** * 2007-2015 PrestaShop * * NOTICE OF LICENSE * * This source file is
subject to the Open Software License (OSL 3.0) * that is bundled with
this package in the file LICENSE.txt. * It is also available through the
world-wide-web at this URL: * http://opensource.org/licenses/osl-3.0.php
* If you did not receive a copy of the license and are unable to *
obtain it through the world-wide-web, please send an email * to
license@prestashop.com so we can send you a copy immediately. * *
DISCLAIMER * * Do not edit or add to this file if you wish to upgrade
PrestaShop to newer * versions in the future. If you wish to customize
PrestaShop for your * needs please refer to http://www.prestashop.com
for more information. * * @author ricardobrito * @copyright Copyright
(c) MercadoPago [http://www.mercadopago.com] * @license
http://opensource.org/licenses/osl-3.0.php Open Software License (OSL
3.0) * International Registered Trademark & Property of MercadoPago *}
<style type="text/css">
.ui-widget-header {
	border: 1px solid #2D3277;
	background: transparent
		url("https://imgmp.mlstatic.com/org-img/banners/ve/medios/575X40.jpg")
		no-repeat;
	color: transparent;
	font-weight: bold;
}
</style>
<div class="lightbox" id="text">
	<div class="box">
		<div class="content">
			<div class="processing">
				<span>{l s='Processing...' mod='mercadopagobr'}</span>
			</div>
		</div>

	</div>
</div>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />

<div class="mp-module">
	{if $creditcard_active == 'true' && $public_key != ''} {if $version ==
	5}
	<div class="payment_module mp-form-custom">
		<div class="row">
			<span class="payment-label">{l s='CREDIT CARD'
				mod='mercadopagobr'} </span> </br> <span class="poweredby">{l s='Powered
				by' mod='mercadopagobr'}</span> <img class="logo"
				src="{$this_path_ssl|escape:'htmlall'}modules/mercadopagobr/views/img/payment_method_logo.png" />
			{if !empty($creditcard_banner)} <img
				src="{$creditcard_banner|escape:'htmlall'}"
				class="mp-creditcard-banner" /> {/if}
		</div>
		<form action="{$custom_action_url|escape:'htmlall'}" method="post"
			id="form-pagar-mp">
			<input id="amount" type="hidden" value="{$amount|escape:'htmlall'}" />
			<input id="payment_method_id" type="hidden" name="payment_method_id" />
			<input id="payment_type_id" type="hidden" name="payment_type_id" />
			<input name="mercadopago_coupon" type="hidden" class="mercadopago_coupon_ticket"/>
			<div class="row">
				<div class="col">
					<label for="id-card-number">{l s='Card number: '
						mod='mercadopagobr'}</label> <input id="id-card-number"
						data-checkout="cardNumber" type="text" />
					<div id="id-card-number-status" class="status"></div>
				</div>
				<div class="col col-expiration">
					<label for="id-card-expiration-month">{l s='Month Exp: '
						mod='mercadopagobr'}</label> <select id="id-card-expiration-month"
						class="small-select" data-checkout="cardExpirationMonth"
						type="text"></select>
				</div>
				<div class="col col-expiration">
					<label for="id-card-expiration-month">{l s='Year Exp: '
						mod='mercadopagobr'}</label> <select id="id-card-expiration-year"
						class="small-select" data-checkout="cardExpirationYear"
						type="text"></select>
					<div id="id-card-expiration-year-status" class="status"></div>
				</div>
				<div class="col">
					<label for="id-card-holder-name">{l s='Card Holder Name:'
						mod='mercadopagobr'}</label> <input id="id-card-holder-name"
						data-checkout="cardholderName" type="text" name="cardholderName" />
					<div id="id-card-holder-name-status" class="status"></div>
				</div>
			</div>
			<div class="row">
				<div class="col col-security">
					<label for="id-security-code">{l s='Security Code: '
						mod='mercadopagobr'}</label> <input id="id-security-code"
						data-checkout="securityCode" type="text" maxlength="4" //> <img
						src="{$this_path_ssl|escape:'htmlall'}modules/mercadopagobr/views/img/cvv.png"
						class="cvv" />
					<div id="id-security-code-status" class="status"></div>
				</div>
				{if $country == 'MLB'}
				<div class="col col-cpf">
					<label for="id-doc-number">{l s='CPF: ' mod='mercadopagobr'}</label>
					<input id="id-doc-number" name="docNumber"
						data-checkout="docNumber" type="text" maxlength="11" />
					<div id="id-doc-number-status" class="status"></div>
					<input name="docType" data-checkout="docType" type="hidden"
						id="id-docType" value="CPF" />
				</div>
				{elseif $country == 'MLM' || $country == 'MLA'}
				<div class="col col-bank">
					<label class="issuers-options" for="id-issuers-options">{l
						s='Bank: ' mod='mercadopagobr'}</label> <select class="issuers-options"
						id="id-issuers-options" name="issuersOptions" type="text>"></select>
				</div>
				{/if}
				<div class="col">
					<label for="id-installments">{l s='Installments: '
						mod='mercadopagobr'}</label> <select id="id-installments"
						name="installments" type="text"></select>
					<div id="id-installments-status" class="status"></div>
				</div>
			</div>

			<div class="row">
				<div class="col-bottom">
					{if $country == 'MLM'}
					<div id="div-card-type">
						<label for="card-types">{l s='Card Type: '
							mod='mercadopagobr'}</label> <input id="id-credit-card" name="card-types"
							type="radio" value="" checked>{l s='Credit'
						mod='mercadopagobr'}</input> <input id="id-debit-card" name="card-types"
							type="radio" value="deb">{l s='Debit' mod='mercadopagobr'}</input>
					</div>
					{elseif $country == 'MLA'}
					<div class="row">
						<div class="col">
							<label for="docType">{l s='Document type: '
								mod='mercadopagobr'}</label> <select name="docType" id="id-docType"
								data-checkout="docType"></select>
						</div>
						<div class="col">
							<input id="id-doc-number" name="docNumber"
								data-checkout="docNumber" type="text" />
							<div id="id-doc-number-status" class="status"></div>
						</div>
					</div>
					{/if} <input type="submit"
						value="{l s='Confirm payment' mod='mercadopagobr'}"
						class="ch-btn ch-btn-big submit" />
				</div>
			</div>
		</form>
		</p>
	</div>

	{elseif $version == 6}

	{if $coupon_active == 'true' }
	<div class="row">
		<div class="col-xs-12 col-md-6">
			<div class="mp-form-custom">

				<div class="row">
					<div class="col title">
						<span class="payment-label"> <img class="logo_cupom"
							src="{$this_path_ssl|escape:'htmlall'}modules/mercadopagobr/views/img/MLB/desconto_MLB.jpg">
						</span>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<label for="couponCode">{l s='Coupon' mod='mercadopagobr'} <strong>Mercado
								Pago:</strong>
						</label> <input type="text" size="19" name="mercadopago_coupon"
							id="mercadopago_coupon" /> <span id="removerDesconto"
							class="btn btn-danger btn-sm">{l s='Remove'
							mod='mercadopagobr'}</span> <span id="aplicarDesconto"
							class="btn btn-primary btn-sm">{l s='Apply'
							mod='mercadopagobr'}</span> <span id="aplicarDescontoDisable"
							class="btn btn-default btn-disabled btn-sm"><i
							class="fa fa-spinner fa-spin"></i> {l s='Waiting'
							mod='mercadopagobr'}...</span>
					</div>
				</div>

				<div class="alert alert-danger" style="margin-top: 10px;"
					id="error_alert" role="alert">...</div>

				<br>
				<ul class="couponApproved nav nav-pills nav-stacked">
					<li>
						<p class="couponApproved ch-form-row discount-link">
							{l s='You save' mod='mercadopagobr'} <b>{$currency->sign}&nbsp;<span
								id="amount_discount"></span></b> {l s='with the exclusive discount'
							mod='mercadopagobr'} <strong style="color: #02298D;">Mercado
								Pago</strong>
						</p>
						<p id="totalCompra">
							{l s='Total of your purchase' mod='mercadopagobr'}: <b>{$currency->sign}&nbsp;<span
								id="total-amount">{$amount|escape:'htmlall'}</span></b>.
						</p>
						<p class="couponApproved">
							<strong>{l s='Total of discount in your purchase'
								mod='mercadopagobr'}:</strong> <b style="font-size: 20px">{$currency->sign}&nbsp;<span
								class="total_amount_discount" id="total_amount_discount"
								alt="decimal"></span><span style="color: red;">*</span>
							</b>.
						</p>
						<p class="couponApproved">
							<span style="color: red;">*</span><label style="font-size: 12px;">{l
								s='Upon approval of the purchase.' mod='mercadopagobr'}</label>
						</p>
						<h6 class="couponApproved">
							<a href="" id="mercadopago_coupon_termsTicket" class="alert-link"
								target="_blank"><strong style="text-decoration: underline;">{l
									s='See conditions' mod='mercadopagobr'}</strong></a>
						</h6>
					</li>
				</ul>
			</div>
		</div>
	</div>

	{/if}

	<div class="row">
		<div class="col-xs-12 col-md-6">
			<div class="mp-form-custom">

				<div class="row">
					<div class="col title">
						<span class="payment-label">{l s='CREDIT CARD'
							mod='mercadopagobr'} </span> </br> <span class="poweredby">{l s='Powered
							by' mod='mercadopagobr'}</span> <img class="logo"
							src="{$this_path_ssl|escape:'htmlall'}modules/mercadopagobr/views/img/payment_method_logo.png">
					</div>
					{if !empty($creditcard_banner)}
					<div class="col title">
						<img src="{$creditcard_banner|escape:'htmlall'}"
							class="mp-creditcard-banner" />
					</div>
					{/if}
				</div>
				<div class="row">
					<label class="ch-form-hint">* {l s='Required fields'
						mod='mercadopagobr'}</label>
				</div>
				<form action="" method="post" id="form-pagar-mp">
					<input id="amount" type="hidden" value="{$amount|escape:'htmlall'}" />
					<input id="payment_method_id" type="hidden" name="payment_method_id" />
					<input id="payment_type_id" type="hidden" name="payment_type_id" />
					<input name="mercadopago_coupon" type="hidden" class="mercadopago_coupon_ticket"/>
					<div class="row">
						<div class="col">
							<label for="id-card-number">{l s='Card number: '
								mod='mercadopagobr'}<em>*</em>
							</label> <input id="id-card-number" data-checkout="cardNumber"
								type="text" />
							<div id="id-card-number-status" class="status"></div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<label for="id-card-expiration-month">{l s='Expiration:'
								mod='mercadopagobr'}<em>*</em>
							</label> <select id="id-card-expiration-month" class="small-select"
								data-checkout="cardExpirationMonth" type="text"></select>
						</div>
						<div class="col">
							<select id="id-card-expiration-year" class="small-select"
								data-checkout="cardExpirationYear" type="text"></select>
							<div id="id-card-expiration-year-status" class="status"></div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<label for="id-card-holder-name">{l s='Card Holder Name:'
								mod='mercadopagobr'}<em>*</em>
							</label> <input id="id-card-holder-name" data-checkout="cardholderName"
								type="text" name="cardholderName" />
							<div id="id-card-holder-name-status" class="status"></div>

						</div>

					</div>
					<div class="row">
						<div class="col">
							<label for="id-security-code" style="font-weight: 700;">{l
								s='Security Code: ' mod='mercadopagobr'}<em>*</em>
							</label> <input id="id-security-code" data-checkout="securityCode"
								type="text" maxlength="4" //> <img
								src="{$this_path_ssl|escape:'htmlall'}modules/mercadopagobr/views/img/cvv.png"
								class="cvv" />
							<div id="id-security-code-status" class="status"></div>
						</div>
					</div>
					{if $country == 'MLB'}
					<div class="row">
						<div class="col">
							<label for="id-doc-number">{l s='CPF: '
								mod='mercadopagobr'}<em>*</em>
							</label> <input id="id-doc-number" data-checkout="docNumber" type="text"
								maxlength="11" />
							<div id="id-doc-number-status" class="status"></div>
							<input name="docType" data-checkout="docType" type="hidden"
								id="id-docType" value="CPF" />
						</div>
					</div>
					{elseif $country == 'MLM' || $country == 'MLA'}
					<div class="row">
						<div class="col">
							<label class="issuers-options" for="id-issuers-options">{l
								s='Bank: ' mod='mercadopagobr'}<em>*</em>
							</label> <select class="issuers-options" id="id-issuers-options"
								name="issuersOptions" type="text"></select>
						</div>
					</div>
					{/if} {if $country == 'MLM'}
					<div class="row">
						<div class="col">
							<label for="card-types">{l s='Card Type: '
								mod='mercadopagobr'}</label> <input id="id-credit-card" name="card-types"
								type="radio" value="" checked>{l s='Credit'
							mod='mercadopagobr'}</input> <input id="id-debit-card" name="card-types"
								type="radio" value="deb">{l s='Debit' mod='mercadopagobr'}</input>
						</div>
					</div>
					{elseif $country == 'MLA' || $country == 'MCO' || $country ==
					'MLV'}
					<div class="row">
						<div class="col">
							<label for="docType">{l s='Document type: '
								mod='mercadopagobr'}<em>*</em>
							</label> <select name="docType" type="text" class="document-type"
								id="id-docType" style="width: 92px;" data-checkout="docType"></select>
						</div>
						<div class="col">
							<input id="id-doc-number" name="docNumber" style="width: 102px;"
								data-checkout="docNumber" type="text" />
							<div id="id-doc-number-status" class="status"></div>
						</div>
					</div>

					<div class="row"></div>
					{/if} {if $country == 'MLC'}
					<div class="row">
						<div class="col">
							<label for="id-doc-number">RUT: <em>*</em></label> <input
								type="hidden" name="docType" id="docType" value="RUT"
								id="id-docType" data-checkout="docType"> <input
								type="text" id="id-doc-number" data-checkout="docNumber"
								maxlength="10" size="14" placeholder="11111111-1">
							<div id="id-doc-number-status" class="status"></div>
						</div>
					</div>
					{/if}

					<div class="row">
						<div class="col">
							<label for="id-installments">{l s='Installments: '
								mod='mercadopagobr'}<em>*</em>
							</label> <select id="id-installments" name="installments" type="text"></select>
							<div id="id-installments-status" class="status"></div>
						</div>
					</div>

					<div class="row" style="display: none;">
						<div class="col-xs-12">
							<p class="payment-errors"></p>
						</div>
					</div>
					<div class="row">
						<div class="col-bottom">
							{if $country != "MLB"}
							<button class="ch-btn ch-btn-big submit"
								value="{l s=' Confirm payment' mod='mercadopagobr'}" type="submit"
								id="btnSubmit">{l s=' Confirm payment'
								mod='mercadopagobr'}</button>
							{else}
							<button class="ch-btn ch-btn-big es-button submit"
								value="{l s=' Confirm payment' mod='mercadopagobr'}" type="submit"
								id="btnSubmit">{l s=' Confirm payment'
								mod='mercadopagobr'}</button>
							{/if}
						</div>
					</div>
				</form>
			</div>
			</p>
		</div>
	</div>

	{/if} {/if} {if $country == 'MLB' || $country == 'MLM' || $country ==
	'MLA' || $country == 'MLC' || $country == 'MCO' || $country == 'MLV'}
	{foreach from=$offline_payment_settings key=offline_payment item=value}
	{if $value.active == "true"} {if $version == 5}
	<div class="payment_module mp-form">
		<div class="row">
			<div class="row">
				<div class="col offline">
					<span class="payment-label">{$value.name|upper}</span><br /> <span
						class="poweredby">{l s='Powered by' mod='mercadopagobr'}</span> <img
						class="logo"
						src="{$this_path_ssl|escape:'htmlall'}modules/mercadopagobr/views/img/payment_method_logo.png">
				</div>
				<a href="javascript:void(0);"
					id="id-{$offline_payment|escape:'htmlall'}" class="offline-payment">
					{l s='Pay through ' mod='mercadopagobr'}{$value.name|ucfirst}{l s='
					via MercadoPago' mod='mercadopagobr'}
					<form action="{$custom_action_url|escape:'htmlall'}" method="post">
						<input name="mercadopago_coupon" type="hidden" class="mercadopago_coupon_ticket"/>
						<input name="payment_method_id" type="hidden"
							value="{$offline_payment|escape:'htmlall'}" /> <input
							type="submit" class="create-boleto"
							id="id-create-{$offline_payment|escape:'htmlall'}">
					</form>
				</a>
			</div>
		</div>
	</div>
	{elseif $version == 6}

	<div class="row">
		<div class="col-xs-12 col-md-6">
			<a href="javascript:void(0);"
				id="id-{$offline_payment|escape:'htmlall'}" class="offline-payment">
				<div class="mp-form-boleto">
					<div class="row boleto">
						<div class="col">
							<span class="payment-label">{$value.name|upper} </span></br> <span
								class="poweredby">{l s='Powered by' mod='mercadopagobr'}</span> <img
								class="logo"
								src="{$this_path_ssl|escape:'htmlall'}modules/mercadopagobr/views/img/payment_method_logo.png">
						</div>
						<form action="{$custom_action_url|escape:'htmlall'}" method="post"
							id="form-{$offline_payment|escape:'htmlall'}" class="formTicket">
							
							<input name="mercadopago_coupon" type="hidden" class="mercadopago_coupon_ticket"/>
							<input name="payment_method_id" type="hidden"
								value="{$offline_payment|escape:'htmlall'}" /> <input
								type="submit" class="create-boleto"
								id="id-create-{$offline_payment|escape:'htmlall'}">

						</form>
					</div>
				</div>
			</a>
		</div>
	</div>
	{/if} {/if} {/foreach} {/if} {if $standard_active eq 'true' &&
	$preferences_url != null} {if $version == 5} {if $window_type !=
	'iframe'}
	<div class="payment_module mp-form">
		<img
			src="{$this_path_ssl|escape:'htmlall'}modules/mercadopagobr/views/img/payment_method_logo_120_31.png"
			id="id-standard-logo"> <a class="standard"
			href="{$preferences_url|escape:'htmlall'}"
			mp-mode="{$window_type|escape:'htmlall'}" id="id-standard"
			name="MP-Checkout">{l s='Pay via MercadoPago and split into '
			mod='mercadopagobr'}</br>{l s=' up to 24 times' mod='mercadopagobr'}
		</a> <img src="{$standard_banner|escape:'htmlall'}"
			class="mp-standard-banner" />
	</div>
	{else}
	<div class="mp-form">
		<iframe src="{$preferences_url|escape:'htmlall'}" name="MP-Checkout"
			width="{$iframe_width|escape:'htmlall'}"
			height="{$iframe_height|escape:'htmlall'}" frameborder="0">
		</iframe>
	</div>
	{/if} {elseif $version == 6}
	<div class="row">
		<div class="col-xs-12 col-md-6">
			{if $window_type != 'iframe'} <a
				href="{$preferences_url|escape:'htmlall'}" id="id-standard"
				mp-mode="{$window_type|escape:'htmlall'}" name="MP-Checkout">
				<div class="mp-form hover">
					<div class="row">
						<div class="col">
							<img
								src="{$this_path_ssl|escape:'htmlall'}modules/mercadopagobr/views/img/payment_method_logo_120_31.png"
								id="id-standard-logo"> <img
								src="{$standard_banner|escape:'htmlall'}"
								class="mp-standard-banner" /> <span
								class="payment-label standard">{l s='Pay via MercadoPago
								and split into up to 24 times' mod='mercadopagobr'}</span>
						</div>
					</div>
				</div>
			</a> {else}
			<div class="mp-form">
				<iframe src="{$preferences_url|escape:'htmlall'}" name="MP-Checkout"
					width="{$iframe_width|escape:'htmlall'}"
					height="{$iframe_height|escape:'htmlall'}" frameborder="0">
				</iframe>
			</div>
			{/if}
		</div>
	</div>
	{/if} {/if}
</div>

<script type="text/javascript">
	var country = "{$country|escape:'javascript'}";


	function loadSubDocType(value) {
		var options = [];
		var subDocType = $("#subDocType");

		if (value == "Pasaporte") {
			subDocType.hide();
		} else if (value == "CI") {
			options.push('<option value="V">V</option>');
			options.push('<option value="E">E</option>');
			subDocType.show();
		} else if (value == "RIF") {
			options.push('<option value="J">J</option>');
			options.push('<option value="P">P</option>');
			options.push('<option value="V">V</option>');
			options.push('<option value="E">E</option>');
			options.push('<option value="G">G</option>');
			subDocType.show();
		}

		subDocType.html(options.join(''));

	}
	// first load force to clear all fields
	$("#id-card-number").val("");
	$("#id-security-code").val("");
	$("#id-card-holder-name").val("");
	$("#id-doc-number").val("");

	var cardBefore = "";

	$("input[data-checkout='cardNumber'], input[name='card-types']").bind(
			"keyup focusout", function() {

				if ($("#id-card-number").val() == cardBefore) {
					return;
				}

				cardBefore = $("#id-card-number").val();

				//limpa o cupom
				//removerCoupon();
				//limpa validação
				$("#id-card-number-status").html("");
				$("#id-card-number").removeClass("form-error");

				var bin = getBin();
				if (bin.length == 6) {

					var json = {}
					json.bin = bin;
					Mercadopago.getPaymentMethod(json, setPaymentMethodInfo);
					Mercadopago.getIdentificationTypes();

				} else if (bin.length < 6) {
					$("#id-card-number").css('background-image', '');
					$("#id-installments").html('');
				}
			});

	function getBin() {
		var card = $("#id-card-number").val().replace(/ /g, '').replace(/-/g,
				'').replace(/\./g, '');
		var bin = card.substr(0, 6);

		return bin;

	}

	// Estabeleça a informação do meio de pagamento obtido
	function setPaymentMethodInfo(status, result) {
		if (status != 404 && status != 400 && result != undefined) {
			//adiciona a imagem do meio de pagamento
			var payment_method = result[0];
			var amount = returnAmount();
			var bin = getBin();
			/*var json = {}
			json.amount = amount;
			json.bin = bin;
			Mercadopago.getInstallments(json, setInstallmentInfo);*/
			//carrega o combo de parcelas
			loadInstallments();

			if (country === "MLM" || country === "MLA") {
				// check if the issuer is necessary to pay
				var issuerMandatory = false, additionalInfo = result[0].additional_info_needed;

				for (var i = 0; i < additionalInfo.length; i++) {
					if (additionalInfo[i] == "issuer_id") {
						issuerMandatory = true;
					}
				}

				if (issuerMandatory) {
					Mercadopago.getIssuers(result[0].id, showCardIssuers);
					$("#id-issuers-options").bind("change", function() {
						setInstallmentsByIssuerId(status, result)
					});
				} else {
					document.querySelector("#id-issuers-options").options.length = 0;
					document.querySelector("#id-issuers-options").style.display = 'none';
					document.querySelector(".issuers-options").style.display = 'none';
				}
			}
			$("#id-card-number").css(
					"background",
					"url(" + payment_method.secure_thumbnail
							+ ") 98% 50% no-repeat");
			$("#payment_method_id").val(
					$("input[name=card-types]:checked").val() ? $(
							"input[name=card-types]:checked").val()
							+ payment_method.id : payment_method.id);

			$("#payment_type_id").val(payment_method.payment_type_id);
			
			
		} else {
			$("#id-card-number").css('background-image', '');
			$("#id-installments").html('');
		}
	};
	function returnAmount() {
		if ($("#amount_discount").text() != "") {
			return $("#total_amount_discount").text();
		} else {
			return $("#amount").val();
		}

	}
	function setInstallmentsByIssuerId(status, response) {
		var amount = returnAmount();
		var issuerId = document.querySelector('#id-issuers-options').value, amount;
		 var paymentMethodId = $("#payment_method").val();
		if (issuerId === '-1') {
			return;
		}
		 
		Mercadopago.getInstallments({
			"payment_method_id" : $("#payment_method_id").val(),
			"payment_type_id" :  $("#payment_type_id").val(),
			"bin" : getBin(),
			"amount" : amount,
			"issuer_id" : issuerId
		}, setInstallmentInfo);
	};

	//Mostre as parcelas disponíveis no div 'installmentsOption'
	function setInstallmentInfo(status, installments) {
		var html_options = "";
		if (status != 404 && status != 400) {
			html_options += "<option value='' selected>{l s='Choice' mod='mercadopagobr'}...</option>";
			var installments = installments[0].payer_costs;
			$.each(installments, function(key, value) {
				html_options += "<option value='"+ value.installments + "'>"
						+ value.recommended_message + "</option>";
			});
		} 
		$("#id-installments").html(html_options);
	};

	function showCardIssuers(status, issuers) {
		var issuersSelector = document.querySelector("#id-issuers-options"), fragment = document
				.createDocumentFragment();

		issuersSelector.options.length = 0;
		var option = new Option("{l s='Choose' mod='mercadopagobr'}...", '-1');
		fragment.appendChild(option);

		for (var i = 0; i < issuers.length; i++) {
			if (issuers[i].name != "default") {
				option = new Option(issuers[i].name, issuers[i].id);
			} else {
				option = new Option("Otro", issuers[i].id);
			}
			fragment.appendChild(option);
		}
		issuersSelector.appendChild(fragment);
		issuersSelector.removeAttribute('disabled');
		document.querySelector(".issuers-options").removeAttribute('style');
		document.querySelector("#id-issuers-options").removeAttribute('style');
	};

	if (country === "MLM" || country === "MLA") {
		$("#id-issuers-options").change(function() {
			var issuerId = $('#id-issuers-options').val();
			var amount = returnAmount();

			Mercadopago.getInstallments({
				"payment_method_id" : $("#payment_method_id").val(),
				"payment_type_id" :  $("#payment_type_id").val(),
				"bin" : getBin(),
				"amount" : amount,
				"issuer_id" : issuerId
			}, setInstallmentInfo);
		});
	}


	var submit = false;
	$("#form-pagar-mp")
			.submit(
					function(event) {
						event.preventDefault();
						clearErrorStatus();
						var $form = $('#form-pagar-mp');
						if (!validate()) {
							event.preventDefault();
							retorno = false;
						} else {

							Mercadopago
									.createToken(
											$form,
											function(status, response) {
												if (response.error) {
													submit = false;
													event.preventDefault();
													$
															.each(
																	response.cause,
																	function(p,
																			e) {
																		switch (e.code) {
																		case "E301":
																			$(
																					"#id-card-number-status")
																					.html(
																							"{l s='Card invalid' mod='mercadopagobr'}");
																			$(
																					"#id-card-number")
																					.addClass(
																							"form-error");
																			break;
																		case "E302":
																			$(
																					"#id-security-code-status")
																					.html(
																							"{l s='CVV invalid' mod='mercadopagobr'}");
																			$(
																					"#id-security-code")
																					.addClass(
																							"form-error");
																			break;
																		case "325":
																		case "326":
																			$(
																					"#id-card-expiration-year-status")
																					.html(
																							"{l s='Date invalid' mod='mercadopagobr'}");
																			$(
																					"#id-card-expiration-month")
																					.addClass(
																							"boxshadow-error");
																			$(
																					"#id-card-expiration-year")
																					.addClass(
																							"boxshadow-error");
																			break;
																		case "316":
																		case "221":
																			$(
																					"#id-card-holder-name-status")
																					.html(
																							"{l s='Name invalid' mod='mercadopagobr'}");
																			$(
																					"#id-card-holder-name")
																					.addClass(
																							"form-error");
																			break;
																		case "324":
																		case "214":
																			$(
																					"#id-doc-number-status")
																					.html(
																							"{l s='Document invalid' mod='mercadopagobr'}");
																			$(
																					"#id-doc-number")
																					.addClass(
																							"form-error");
																			break;
																		}
																	});
												} else {
													submit = true;
													var card_token_id = response.id;
													$form
															.append($(
																	'<input type="hidden" id="card_token_id" name="card_token_id"/>')
																	.val(
																			card_token_id));

													var cardNumber = $(
															"#id-card-number")
															.val();

													var lastFourDigits = cardNumber
															.substring(cardNumber.length - 4);
													$form
															.append($('<input name="lastFourDigits" type="hidden" value="' + lastFourDigits + '"/>'));
													document
															.getElementById("form-pagar-mp").action = "{$custom_action_url|escape:'htmlall'}";
													document.getElementById(
															"form-pagar-mp")
															.submit();
													$(".lightbox").show();
												}

											})

						}
					});

	var submit = false;

	function validate() {
		if ($("#id-card-number").val().length == 0) {
			$("#id-card-number-status").html(
					"{l s='Card invalid' mod='mercadopagobr'}");
			$("#id-card-number").addClass("form-error");
		}

		if ($("#id-card-holder-name").val().length == 0) {
			$("#id-card-holder-name-status").html(
					"{l s='Name invalid' mod='mercadopagobr'}");
			$("#id-card-holder-name").addClass("form-error");
		}

		if ($("#id-security-code").val().length == 0) {
			$("#id-security-code-status").html(
					"{l s='CVV invalid' mod='mercadopagobr'}");
			$("#id-security-code").addClass("form-error");
		}

		if ($("#id-docType").val() == null || $("#id-docType").val() == "") {
			$("#id-docType").addClass("form-error");
		}

		if ($("#id-doc-number").val().length == 0) {
			$("#id-doc-number-status").html(
					"{l s='Document invalid' mod='mercadopagobr'}");
			$("#id-doc-number").addClass("form-error");
		}

		if ($("#id-installments").val() == null
				|| $("#id-installments").val().length == 0) {
			$("#id-installments-status").html(
					"{l s='Installments invalid' mod='mercadopagobr'}");
			$("#id-installments").addClass("form-error");
		}

		if ($("#id-installments").val() == null
				|| $("#id-installments").val().length == 0
				|| $("#id-security-code").val().length == 0
				|| $("#id-card-holder-name").val().length == 0
				|| $("#id-card-number").val().length == 0
				|| $("#id-doc-number").val().length == 0) {
			return false;
		}

		if (country == "MLB") {
			if (!validateCpf($("#id-doc-number").val())) {
				$("#id-doc-number-status").html(
						"{l s='CPF invalid' mod='mercadopagobr'}");
				$("#id-doc-number").addClass("form-error");
				return false;
			}
		}

		return true;
	}

	function clearErrorStatus() {
		$("#id-card-number-status").html("");
		$("#id-security-code-status").html("");
		$("#id-card-expiration-month-status").html("");
		$("#id-card-expiration-year-status").html("");
		$("#id-card-holder-name-status").html("");
		$("#id-doc-number-status").html("");
		$("#id-installments-status").html("");

		$("#id-card-number").removeClass("form-error");
		$("#id-security-code").removeClass("form-error");
		$("#id-card-expiration-month").removeClass("boxshadow-error");
		$("#id-card-expiration-year").removeClass("boxshadow-error");
		$("#id-card-holder-name").removeClass("form-error");
		$("#id-doc-number").removeClass("form-error");
		$("#id-installments").removeClass("form-error");
		$("#id-docType").removeClass("form-error");

	}
	function validateCpf(cpf) {
		var soma;
		var resto;
		soma = 0;
		if (cpf == "00000000000")
			return false;

		for (i = 1; i <= 9; i++) {
			soma = soma + parseInt(cpf.substring(i - 1, i)) * (11 - i);
			resto = (soma * 10) % 11;
		}

		if ((resto == 10) || (resto == 11))
			resto = 0;

		if (resto != parseInt(cpf.substring(9, 10)))
			return false;

		soma = 0;

		for (i = 1; i <= 10; i++) {
			soma = soma + parseInt(cpf.substring(i - 1, i)) * (12 - i);
			resto = (soma * 10) % 11;
		}

		if ((resto == 10) || (resto == 11))
			resto = 0;

		if (resto != parseInt(cpf.substring(10, 11))) {
			return false;
		} else {
			return true;
		}
	}

	function setExpirationYear() {
		var html_options = "";
		var currentYear = new Date().getFullYear();

		for (i = 0; i <= 20; i++) {
			html_options += "<option value='"
					+ (currentYear + i).toString().substr(2, 2) + "'>"
					+ (currentYear + i) + "</option>";
		}
		;
		$("#id-card-expiration-year").html(html_options);
	}

	function setExpirationMonth() {
		var html_options = "";
		var currentMonth = new Date().getMonth();
		var months = [ "{l s='January' mod='mercadopagobr'}",
				"{l s='Febuary' mod='mercadopagobr'}",
				"{l s='March' mod='mercadopagobr'}",
				"{l s='April' mod='mercadopagobr'}",
				"{l s='May' mod='mercadopagobr'}",
				"{l s='June' mod='mercadopagobr'}",
				"{l s='July' mod='mercadopagobr'}",
				"{l s='August' mod='mercadopagobr'}",
				"{l s='September' mod='mercadopagobr'}",
				"{l s='October' mod='mercadopagobr'}",
				"{l s='November' mod='mercadopagobr'}",
				"{l s='December' mod='mercadopagobr'}" ];

		for (i = 0; i < 12; i++) {
			if (currentMonth == i)
				html_options += "<option value='" + (i + 1) + "' selected>"
						+ months[i] + "</option>";
			else
				html_options += "<option value='" + (i + 1) + "'>" + months[i]
						+ "</option>";
		}
		;

		$("#id-card-expiration-month").html(html_options);
	}

	setExpirationYear();
	setExpirationMonth();



	function createModal() {
		$("body").append($(".lightbox"));
	}

	createModal();

	// need to set 0 so modal checkout can work
	$("#header").css("z-index", 0);
	if ("{$standard_active|escape:'javascript'}" == "true"
			&& "{$window_type|escape:'javascript'}" == "iframe") {
		$(".mp-form")
				.css(
						"width",
						parseInt("{$iframe_width|escape:'javascript'}", 10)
								+ 20 + "px");
		$(".mp-form").css(
				"height",
				parseInt("{$iframe_height|escape:'javascript'}", 10) + 20
						+ "px");
	}

	/*
	 *
	 * COUPON
	 *
	 */
	//hide all info
	$("#aplicarDescontoDisable").hide();

	//show loading
	$("#removerDesconto").hide();

	//Esconde todas as mensagens
	$("#error_alert").hide();

	removerDesconto("");
	removerDesconto("Ticket");

	$("#mercadopago_coupon").bind("change", function() {
		if (couponMensagemError(null, "")) {
			carregarDesconto("");
		}

	})

	//action apply            
	$("#aplicarDescontoTicket").click(function() {
		if (couponMensagemError(null, "Ticket")) {
			carregarDesconto("Ticket");
		}
	});

	//action apply            
	$("#aplicarDesconto").click(function() {
		if (couponMensagemError(null, "")) {
			carregarDesconto("");
		}
	});

	function carregarDesconto(cupomTicket) {

		var aplicarDescontoDisable = null;
		var error_alert = null;
		var aplicarDesconto = null;
		var mercadopago_coupon = null;

		var totalCompra = null;
		var removerDescontoButton = null;
		var couponApproved = null;
		var amount_discount = null;
		var total_amount = null;
		var total_amount_discount = null;
		var mercadopago_coupon_terms = null;
		var amount = null;

		var coupon = null;
		
		var mercadopago_coupon_ticket = $(".mercadopago_coupon_ticket");
		
		aplicarDescontoDisable = $("#aplicarDescontoDisable");
		error_alert = $("#error_alert");
		aplicarDesconto = $("#aplicarDesconto");
		mercadopago_coupon = $("#mercadopago_coupon");

		totalCompra = $("#totalCompra");
		removerDescontoButton = $("#removerDesconto");
		couponApproved = $(".couponApproved");
		amount_discount = $("#amount_discount");
		total_amount = $("#total_amount");
		total_amount_discount = $("#total_amount_discount");
		mercadopago_coupon_terms = $("#mercadopago_coupon_terms");
		amount = $("#amount");
		coupon = $("#mercadopago_coupon");
		
		aplicarDescontoDisable.show();
		error_alert.hide();
		aplicarDesconto.hide();
		aplicarDescontoDisable.show();

		$
				.ajax({
					type : "GET",
					url : "{$discount_action_url|escape:'htmlall'}"
							+ "?$coupon_id=" + coupon.val(),
					success : function(r) {

						if (r.status == 200) {
							
							mercadopago_coupon_ticket.val(coupon.val());
							
							totalCompra.css('text-decoration', 'line-through');

							aplicarDesconto.hide();
							removerDescontoButton.show();
							couponApproved.show();

							coupon.attr('readonly', true);

							var coupon_amount = (r.response.coupon_amount)
									.toFixed(2)
							var transaction_amount = (r.response.transaction_amount)
									.toFixed(2)
							var id_coupon = r.response.id;

							var url_term = "https://api.mercadolibre.com/campaigns/"
									+ id_coupon
									+ "/terms_and_conditions?format_type=html"

							amount_discount.html(coupon_amount);
							total_amount.html(transaction_amount);

							var total_amount_discount_v = (transaction_amount - coupon_amount)
									.toFixed(2);

							total_amount_discount.html(total_amount_discount_v);

							mercadopago_coupon_terms.attr("href", url_term);

							if (validateCard()) {
								loadInstallments();
							}

						} else {
							removerDesconto(cupomTicket);
							
							couponMensagemError(r, cupomTicket);

							if ($("#id-installments").val() != null
									&& $("#id-installments").val().length > 0) {
								loadInstallments();
							}
						}
					},
					error : function() {
						aplicarDesconto.show();
						removerDescontoButton.hide();

						if ($("#id-installments").val() != null
								&& $("#id-installments").val().length > 0) {
							loadInstallments();
						}

					},
					complete : function() {
						aplicarDescontoDisable.hide();

					}
				})
	}

	$("#removerDesconto").click(function() {
		removerDesconto("");
		loadInstallments();
	});

	$("#removerDescontoTicket").click(function() {
		removerDesconto("Ticket");
	});

	function removerDesconto(cupomTicket) {
		var coupon = null;
		var aplicarDesconto = null;
		var removerDesconto = null;
		var couponApproved = null;
		var totalCompra = null;
		var amount_discount = null;
		var aplicarDescontoDisable = null;
		var error_alert = null;
		
		mercadopago_coupon_ticket = $(".mercadopago_coupon_ticket");
		coupon = $("#mercadopago_coupon");
		aplicarDesconto = $("#aplicarDesconto");
		removerDesconto = $("#removerDesconto");
		couponApproved = $(".couponApproved");
		totalCompra = $("#totalCompra");
		amount_discount = $("#amount_discount");
		aplicarDescontoDisable = $("#aplicarDescontoDisable");
		error_alert = $("#error_alert");

		coupon.attr('readonly', false);
		coupon.val("");
		mercadopago_coupon_ticket.val("");
		aplicarDesconto.show();
		removerDesconto.hide();
		couponApproved.hide();
		totalCompra.css('text-decoration', '');
		amount_discount.text("");
		aplicarDescontoDisable.hide();
		error_alert.hide();
	}

	function couponMensagemError(r, cupomTicket) {
		var error_alert = null;
		var mercadopago_coupon = null;
		var amount_discount = null;
		error_alert = $("#error_alert");
		mercadopago_coupon = $("#mercadopago_coupon");
		amount_discount = $("#amount_discount");

		error_alert.html("");
		var retorno = true;
		if (r == null) {
			if (mercadopago_coupon.val().trim().length == 0) {
				error_alert.html("{l s='Coupon is required.' mod='mercadopagobr'}");
				retorno = false;
			} 
		} else {
			retorno = false;
			if (r.response.error == "campaign-code-doesnt-match") {
				error_alert
						.html("{l s='Doesn\'t find a campaign with the given code.' mod='mercadopagobr'}");
			} else if (r.response.error == "transaction_amount_invalid") {
				error_alert
						.html("{l s='The coupon can not be applied to this amount.' mod='mercadopagobr'}");
			} else if (r.response.error == "run-out-of-uses") {
				error_alert
						.html("{l s='Run Out of uses per user.' mod='mercadopagobr'}");
			} else if (r.response.error == "run-out-of-uses") {
				error_alert
						.html("{l s='Please enter a valid coupon code.' mod='mercadopagobr'}");
			} else if (r.response.error == "amount-doesnt-match") {
				error_alert
						.html("{l s='Doesn\'t reach the mininimal amount or max amount.' mod='mercadopagobr'}");
			} else {
				error_alert
						.html("{l s='An error occurred while validating the coupon. Try again.' mod='mercadopagobr'}");
			}
		}

		error_alert.show();
		error_alert.fadeTo(10000, 2000).slideUp(2000, function() {
			error_alert.hide();
		});

		return retorno;

	}

	function validateCard() {
		if ($("#id-card-number").val().length == 0) {
			return false;
		}
		return true;
	}

	function loadInstallments() {
		//load Installment
		var bin = getBin();
		var json = {}
		json.amount = returnAmount();
		json.bin = bin;
		
		if (country === "MLM" || country === "MLA") {
			var issuerId = document.querySelector('#id-issuers-options').value;
			if (issuerId != undefined && issuerId != "-1") {
				json.issuer_id = issuerId;
				json.payment_method_id = $("#payment_method_id").val();
				json.payment_type_id = $("#payment_type_id").val();		
			}
		} 
		Mercadopago.getInstallments(json, setInstallmentInfo);
	}

	$('#mercadopago_coupon').on('keyup keypress', function(e) {
		var keyCode = e.keyCode || e.which;
		if (keyCode === 13) {
			e.preventDefault();
			return false;
		}
	});
	
	
	$(".offline-payment").click(function(e) {
		var $form = $('.formTicket');
		$form
		.append($(
				'<input type="hidden" id="mercadopago_coupon" name="mercadopago_coupon"/>').val($("#mercadopago_coupon").val()));			
		$(".create-boleto", this).click();

	});

	$(".create-boleto").click(function(e) {
		$(".lightbox").show();
		e.stopImmediatePropagation();
	});	
	
</script>