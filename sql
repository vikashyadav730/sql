WITH
  actuals_stage AS (
  SELECT
    o2.bic_cases_fre + o2.bic_cases_rev AS std_cases,
    o2.bic_tons_rev + o2.bic_tons_fre AS total_tons,
    o2.bic_pieces_fr + o2.bic_pieces_re AS total_pieces,
    o2.bic_liters_fr + o2.bic_liters_re AS total_liters,
    o2.bic_gsales AS gross_sales,
    o2.bic_n_sp_fg AS special_pack_fg,
    o2.bic_n_fg_cons AS free_goods_cons,
    o2.bic_n_off_lab AS off_labels,
    o2.bic_n_bon_pac AS bonus_packs,
    o2.bic_n_coupon AS coupons,
    o2.bic_n_con_off AS co_reb_pay,
    o2.bic_n_ppr AS permanent_price_red,
    o2.bic_n_tpr_05 AS temporary_price_red,
    o2.bic_N_TPR_05 - o2.bic_A_VVG48 - o2.bic_N_IN_COU AS tpr_w_wdrwl_exfact,
    o2.bic_n_evrylow AS every_day_low_price,
    o2.bic_n_clo_out AS closeouts,
    o2.bic_n_ipp AS inventory_price_pro,
    o2.bic_n_pro_pay AS prompt_payment,
    o2.bic_n_eff_log AS efficient_logistics,
    o2.bic_n_eff_man AS efficient_management,
    o2.bic_n_cust_pr AS customer_promotions,
    o2.bic_n_in_pros AS cust_promo_fixed_overabove,
    o2.bic_n_assort AS assortment,
    o2.bic_n_gro_dir AS growth_direct,
    o2.bic_n_npi AS new_product_incent,
    o2.bic_n_mm_serv AS middleman_perform,
    o2.bic_n_ind_sfi AS middleman_infrastruc,
    o2.bic_n_gro_ind AS growth_indirect,
    o2.bic_n_iri AS indir_retailer_inv,
    o2.bic_n_iri + 0 AS indir_retailer_inv_total,
    CAST(o2.bic_n_ins_ind AS FLOAT64) AS in_store_support_indirect,
    CAST(o2.bic_n_trd_lod AS FLOAT64) AS trade_loads,
    o2.bic_n_lis_all AS listing_allowances,
    o2.bic_n_nptp AS nonperf_trade_pay,
    o2.bic_n_continu AS continuity_discounts,
    o2.bic_n_ot_cust AS all_oth_cust_disc,
    o2.bic_inv_sales AS invoiced_sales,
    o2.bic_net_sales AS net_sales,
    o2.bic_n_vvg81 AS shopper_marketing,
    o2.bic_n_sp_fg + o2.bic_n_coupon + o2.bic_n_con_off + o2.bic_n_ppr + o2.bic_n_tpr_05 + o2.bic_n_evrylow + o2.bic_n_clo_out + o2.bic_n_ipp AS consumer_investment,
    o2.bic_n_sp_fg + o2.bic_n_coupon + o2.bic_n_con_off + o2.bic_n_ppr + o2.bic_n_tpr_05 + o2.bic_n_evrylow + o2.bic_n_clo_out + o2.bic_n_ipp AS prcnt_consumer_investment,
    o2.bic_n_sp_fg + o2.bic_n_coupon + o2.bic_n_con_off + o2.bic_n_tpr_05 + o2.bic_n_evrylow + o2.bic_n_clo_out + o2.bic_n_ipp AS prcnt_consumer_investment_excl_ppr,
    o2.bic_n_tpr_o + o2.bic_a_vvg48 AS tpr_oi,
    o2.bic_n_tpr_l AS tpr_deferred,
    o2.bic_n_in_cou AS tpr_scan,
    o2.bic_n_pro_pay + o2.bic_n_eff_log + o2.bic_n_eff_man + o2.bic_n_cust_pr + o2.bic_n_assort + o2.bic_n_gro_dir + o2.bic_n_npi + o2.bic_n_vvg81 + o2.bic_n_mm_serv + o2.bic_n_ind_sfi + o2.bic_n_gro_ind + o2.bic_n_iri + o2.bic_n_ind_fg + o2.bic_n_lis_all + o2.bic_n_nptp + o2.bic_n_sp_fg + o2.bic_n_coupon + o2.bic_n_con_off + o2.bic_n_ppr + o2.bic_n_tpr_05 + o2.bic_n_evrylow + o2.bic_n_clo_out + o2.bic_n_ipp AS gross_to_net,
    (o2.bic_n_pro_pay + o2.bic_n_eff_log + o2.bic_n_eff_man + o2.bic_n_cust_pr + o2.bic_n_assort + o2.bic_n_gro_dir + o2.bic_n_npi + o2.bic_n_vvg81 + o2.bic_n_mm_serv + o2.bic_n_ind_sfi + o2.bic_n_gro_ind + o2.bic_n_iri + o2.bic_n_ind_fg + o2.bic_n_lis_all + o2.bic_n_nptp + o2.bic_n_sp_fg + o2.bic_n_coupon + o2.bic_n_con_off + o2.bic_n_ppr + o2.bic_n_tpr_05 + o2.bic_n_evrylow + o2.bic_n_clo_out + o2.bic_n_ipp) AS gross_to_net_prcnt,
    (o2.bic_n_pro_pay + o2.bic_n_eff_log + o2.bic_n_eff_man + o2.bic_n_cust_pr + o2.bic_n_assort + o2.bic_n_gro_dir + o2.bic_n_npi + o2.bic_n_vvg81 + o2.bic_n_mm_serv + o2.bic_n_ind_sfi + o2.bic_n_gro_ind + o2.bic_n_iri + o2.bic_n_ind_fg + o2.bic_n_lis_all + o2.bic_n_nptp + o2.bic_n_sp_fg + o2.bic_n_coupon + o2.bic_n_con_off + o2.bic_n_tpr_05 + o2.bic_n_evrylow + o2.bic_n_clo_out + o2.bic_n_ipp) AS gross_to_net_excl_ppr_prcnt,
    o2.bic_n_cust_pr - o2.bic_n_in_pros AS cust_promo_terms,
    o2.bic_n_cooppct AS customer_promo_coop_adv_prcnt,
    o2.bic_n_pro_pay + o2.bic_n_eff_log + o2.bic_n_eff_man + o2.bic_n_cust_pr + o2.bic_n_assort + o2.bic_n_gro_dir + o2.bic_n_npi + o2.bic_n_vvg81 + o2.bic_n_mm_serv + o2.bic_n_ind_sfi + o2.bic_n_gro_ind + o2.bic_n_iri + o2.bic_n_ind_fg + o2.bic_n_lis_all + o2.bic_n_nptp AS customer_investment,
    o2.bic_n_pro_pay + o2.bic_n_eff_log + o2.bic_n_eff_man + o2.bic_n_cust_pr + o2.bic_n_assort + o2.bic_n_gro_dir + o2.bic_n_npi + o2.bic_n_vvg81 + o2.bic_n_mm_serv + o2.bic_n_ind_sfi + o2.bic_n_gro_ind + o2.bic_n_iri + o2.bic_n_ind_fg + o2.bic_n_lis_all + o2.bic_n_nptp AS prcnt_customer_investment,
    o2.bic_n_coop AS customer_promo_coop_adv,
    o2.bic_n_coup_sl + o2.bic_n_ppr + o2.bic_n_tpr_05 + o2.bic_n_evrylow + o2.bic_n_ipp + o2.bic_n_eff_man + o2.bic_n_assort + o2.bic_n_cust_pr + o2.bic_n_gro_dir + o2.bic_n_fg_dir + o2.bic_n_ind_fg + o2.bic_n_mm_serv + o2.bic_n_ind_sfi + o2.bic_n_gro_ind + o2.bic_n_iri + o2.bic_n_ind_fg + o2.bic_n_lis_all + o2.bic_n_nptp + o2.bic_n_npi AS trade_spend,
    o2.bic_n_coup_sl + o2.bic_n_ppr + o2.bic_n_tpr_05 + o2.bic_n_evrylow + o2.bic_n_ipp + o2.bic_n_eff_man + o2.bic_n_assort + o2.bic_n_cust_pr + o2.bic_n_gro_dir + o2.bic_n_fg_dir + o2.bic_n_ind_fg + o2.bic_n_mm_serv + o2.bic_n_ind_sfi + o2.bic_n_gro_ind + o2.bic_n_iri + o2.bic_n_ind_fg + o2.bic_n_lis_all + o2.bic_n_nptp + o2.bic_n_npi + o2.bic_n_sp_fg AS kam_controlled,
    o2.bic_n_fg_dir AS free_goods_to_trade,
    o2.bic_n_ind_fg AS free_goods_indirect,
    o2.bic_std_cost + o2.bic_oth_cost AS total_variable_cost,
    o2.bic_std_cost AS standard_cost,
    o2.bic_oth_cost AS all_other_variable_cost,
    o2.bic_net_sales - (o2.bic_std_cost ) AS standard_margin,
    o2.bic_net_sales - (o2.bic_std_cost ) AS prcnt_standard_margin,
    o2.bic_net_sales - (o2.bic_std_cost + o2.bic_oth_cost) AS financial_margin,
    o2.bic_net_sales - (o2.bic_std_cost + o2.bic_oth_cost) AS prcnt_financial_margin,
    o2.bic_net_sales + 0 AS asp_case,
    o2.bic_net_sales + 0 AS asp_pounds,
    o2.bic_net_sales + 0 AS asp_std_case,
    o2.bic_net_sales + 0 AS asp_ton,
    o2.bic_net_sales + 0 AS asp_eaches,
    o2.bic_net_sales + 0 AS asp_liters,
    o2.bic_net_sales + 0 AS asp_pieces,
    (o2.bic_n_sp_fg + o2.bic_n_coupon + o2.bic_n_con_off + o2.bic_n_ppr + o2.bic_n_tpr_05 + o2.bic_n_evrylow + o2.bic_n_clo_out + o2.bic_n_ipp) + (o2.bic_n_pro_pay + o2.bic_n_eff_log + o2.bic_n_eff_man + o2.bic_n_cust_pr + o2.bic_n_assort + o2.bic_n_gro_dir + o2.bic_n_npi + o2.bic_n_vvg81 + o2.bic_n_mm_serv + o2.bic_n_ind_sfi + o2.bic_n_gro_ind + o2.bic_n_iri + o2.bic_n_ind_fg + o2.bic_n_lis_all + o2.bic_n_nptp) AS total_rpc,
    (o2.bic_n_pro_pay + o2.bic_n_eff_log + o2.bic_n_eff_man + o2.bic_n_cust_pr + o2.bic_n_assort + o2.bic_n_gro_dir + o2.bic_n_npi + o2.bic_n_vvg81 + o2.bic_n_mm_serv + o2.bic_n_ind_sfi + o2.bic_n_gro_ind + o2.bic_n_iri + o2.bic_n_ind_fg + o2.bic_n_lis_all + o2.bic_n_nptp) AS customer_rpc,
    (o2.bic_n_sp_fg + o2.bic_n_coupon + o2.bic_n_con_off + o2.bic_n_ppr + o2.bic_n_tpr_05 + o2.bic_n_evrylow + o2.bic_n_clo_out + o2.bic_n_ipp) AS consumer_rpc,
    (o2.bic_n_sp_fg + o2.bic_n_coupon + o2.bic_n_con_off + o2.bic_n_ppr + o2.bic_n_tpr_05 + o2.bic_n_evrylow + o2.bic_n_clo_out + o2.bic_n_ipp ) + (o2.bic_n_pro_pay + o2.bic_n_eff_log + o2.bic_n_eff_man + o2.bic_n_cust_pr + o2.bic_n_assort + o2.bic_n_gro_dir + o2.bic_n_npi + o2.bic_n_vvg81 + o2.bic_n_mm_serv + o2. bic_n_ind_sfi + o2.bic_n_gro_ind + o2.bic_n_iri + o2.bic_n_ind_fg + o2.bic_n_lis_all + o2.bic_n_nptp) AS total_rpc_tons,
    (o2.bic_n_sp_fg + o2.bic_n_coupon + o2.bic_n_con_off + o2.bic_n_ppr + o2.bic_n_tpr_05 + o2.bic_n_evrylow + o2.bic_n_clo_out + o2.bic_n_ipp) AS consumer_rpc_tons,
    (o2.bic_n_pro_pay + o2.bic_n_eff_log + o2.bic_n_eff_man + o2.bic_n_cust_pr + o2.bic_n_assort + o2.bic_n_gro_dir + o2.bic_n_npi + o2.bic_n_vvg81 + o2.bic_n_mm_serv + o2.bic_n_ind_sfi + o2.bic_n_gro_ind + o2.bic_n_iri + o2.bic_n_ind_fg + o2.bic_n_lis_all + o2.bic_n_nptp) AS customer_rpc_tons,
    (o2.bic_n_sp_fg + o2.bic_n_coupon + o2.bic_n_con_off + o2.bic_n_ppr + o2.bic_n_tpr_05 + o2.bic_n_evrylow + o2.bic_n_clo_out + o2.bic_n_ipp) + (o2.bic_n_pro_pay + o2.bic_n_eff_log + o2.bic_n_eff_man + o2.bic_n_cust_pr + o2.bic_n_assort + o2.bic_n_gro_dir + o2.bic_n_npi + o2.bic_n_vvg81 + o2.bic_n_mm_serv + o2. bic_n_ind_sfi + o2.bic_n_gro_ind + o2.bic_n_iri + o2.bic_n_ind_fg + o2.bic_n_lis_all + o2.bic_n_nptp) AS total_rpc_pieces_selling_units,
    (o2.bic_n_sp_fg + o2.bic_n_coupon + o2.bic_n_con_off + o2.bic_n_ppr + o2.bic_n_tpr_05 + o2.bic_n_evrylow + o2.bic_n_clo_out + o2.bic_n_ipp) AS consumer_rpc_pieces_selling_units,
    (o2.bic_n_pro_pay + o2.bic_n_eff_log + o2.bic_n_eff_man + o2.bic_n_cust_pr + o2.bic_n_assort + o2.bic_n_gro_dir + o2.bic_n_npi + o2.bic_n_vvg81 + o2.bic_n_mm_serv + o2.bic_n_ind_sfi + o2.bic_n_gro_ind + o2.bic_n_iri + o2.bic_n_ind_fg + o2.bic_n_lis_all + o2.bic_n_nptp) AS customer_rpc_pieces_selling_units,
    (o2.bic_n_sp_fg + o2.bic_n_coupon + o2.bic_n_con_off + o2.bic_n_ppr + o2.bic_n_tpr_05 + o2.bic_n_evrylow + o2.bic_n_clo_out + o2.bic_n_ipp) + (o2.bic_n_pro_pay + o2.bic_n_eff_log + o2.bic_n_eff_man + o2.bic_n_cust_pr + o2.bic_n_assort + o2.bic_n_gro_dir + o2.bic_n_npi + o2.bic_n_vvg81 + o2.bic_n_mm_serv + o2. bic_n_ind_sfi + o2.bic_n_gro_ind + o2.bic_n_iri + o2.bic_n_ind_fg + o2.bic_n_lis_all + o2.bic_n_nptp) AS total_rpc_eaches,
    (o2.bic_n_sp_fg + o2.bic_n_coupon + o2.bic_n_con_off + o2.bic_n_ppr + o2.bic_n_tpr_05 + o2.bic_n_evrylow + o2.bic_n_clo_out + o2.bic_n_ipp) AS consumer_rpc_eaches,
    (o2.bic_n_pro_pay + o2.bic_n_eff_log + o2.bic_n_eff_man + o2.bic_n_cust_pr + o2.bic_n_assort + o2.bic_n_gro_dir + o2.bic_n_npi + o2.bic_n_vvg81 + o2.bic_n_mm_serv + o2.bic_n_ind_sfi + o2.bic_n_gro_ind + o2.bic_n_iri + o2.bic_n_ind_fg + o2.bic_n_lis_all + o2.bic_n_nptp) AS customer_rpc_eaches,
    o2.bic_VV120 AS total_eaches_consumer_units,
    o2.bic_g_taxes + o2.bic_g_ret_all AS returns_and_taxes,
    o2.bic_g_taxes AS sales_and_excise_taxes,
    o2.bic_g_taxes + 0 AS sales_and_excise_tax_prcnt,
    o2.bic_g_ret_all AS sales_returns,
    o2.bic_n_net_gs AS adjusted_gross_sales,
    o2.bic_n_pro_pay + 0 AS prompt_payment_oi,
    o2.bic_n_eff_log + 0 AS efficient_logistics_oi,
    o2.bic_n_eff_man + 0 AS efficient_management_deferred,
    o2.bic_e_vvm09 AS customer_promo_in_store,
    o2.bic_n_coop + 0 AS coop_adv_fixed,
    o2.bic_n_cooppct + 0 AS coop_adv_variable,
    o2.bic_n_in_pro AS in_store_promo_trade,
    o2.total_volume_suom AS total_volume_sales_uom,
    o2.total_volume_buom AS total_volume_base_uom,
    o2.bic_n_ullage*-1 AS claim_sales,
    o2.bic_n_cons_cp AS couponstrade,
    o2.bic_n_coup_sl AS couponssales,
    o2.bic_pounds AS total_volume_pounds,
    o2.bic_n_coupon + o2.bic_n_con_off + o2.bic_n_ppr + o2.bic_n_tpr_05 + o2.bic_n_evrylow + o2.bic_n_clo_out + o2.bic_n_ipp AS simplified_planning_cons_inv,
    o2.bic_n_coupon + o2.bic_n_con_off + o2.bic_n_ppr + o2.bic_n_tpr_05 + o2.bic_n_evrylow + o2.bic_n_clo_out + o2.bic_n_ipp AS prcnt_simplified_planning_cons_inv,
    o2.bic_n_cust_pr + o2.bic_n_assort + o2.bic_n_gro_dir + o2.bic_n_vvg81 + o2.bic_n_mm_serv + o2.bic_n_ind_sfi + o2.bic_n_gro_ind + o2.bic_n_iri + o2.bic_n_ind_fg + o2.bic_n_lis_all + o2.bic_n_nptp AS simplified_planning_cust_inv,
    o2.bic_n_cust_pr + o2.bic_n_assort + o2.bic_n_gro_dir + o2.bic_n_vvg81 + o2.bic_n_mm_serv + o2.bic_n_ind_sfi + o2.bic_n_gro_ind + o2.bic_n_iri + o2.bic_n_ind_fg + o2.bic_n_lis_all + o2.bic_n_nptp AS prcnt_simplified_planning_cust_inv,
    o2.bic_n_pro_pay + o2.bic_n_eff_log + o2.bic_n_eff_man AS simplified_planning_logistics_prompt_pay,
    o2.bic_n_pro_pay + o2.bic_n_eff_log + o2.bic_n_eff_man AS prcnt_simplified_planning_logistics_prompt_pay,
    o2.bic_n_npi + 0 AS prcnt_new_product_incent,
    o2.bic_n_vvp20 AS incremental_display_cost,
    o2.bic_n_vvp20 + 0 AS prcnt_incremental_display_cost,
    o2.bic_NVO AS nvo,
    o2.bic_NVO + 0 AS prcnt_nvo,
    o2.bic_media AS media,
    o2.bic_media + 0 AS prcnt_media,
    o2.bic_promotion AS promotion,
    o2.bic_promotion + 0 AS prcnt_total_promotion,
    o2.bic_promotion - o2.bic_n_vvp20 AS promtion_less_incremental_display_cost,
    o2.bic_net_sales - (o2.bic_std_cost ) - o2.bic_NVO - o2.bic_promotion - o2.bic_media AS standard_operating_cost,
    o2.bic_net_sales - (o2.bic_std_cost ) - o2.bic_NVO - o2.bic_promotion - o2.bic_media AS prcnt_standard_operating_cost,
    o2.bic_net_sales - (o2.bic_std_cost + o2.bic_oth_cost) - o2.bic_NVO - o2.bic_promotion - o2.bic_media AS financial_operating_cost,
    o2.bic_net_sales - (o2.bic_std_cost + o2.bic_oth_cost) - o2.bic_NVO - o2.bic_promotion - o2.bic_media AS prcnt_financial_operating_cost,
    o2.salesorg salesorg,
    o2.Promo_Ind,
    o2.mat_sales mat_sales,
    o2.cust_sales,
    o2.calmonth,
    o2.plant,
    CAST(SUBSTR(o2.calmonth, 0, 4) AS int64) years,
    CAST(CASE
        WHEN CAST(SUBSTR(o2.calmonth, 5, 2) AS int64)<10 THEN CAST(FORMAT("0%d",CAST(SUBSTR(o2.calmonth, 5, 2) AS int64)) AS string)
      ELSE
      SUBSTR(o2.calmonth, 5, 2)
    END
      AS int64) month,
    CONCAT(SUBSTR(o2.calmonth, 0, 4),'-',
      CASE
        WHEN CAST(SUBSTR(o2.calmonth, 5, 2) AS int64)<10 THEN CAST(FORMAT("0%d",CAST(SUBSTR(o2.calmonth, 5, 2) AS int64)) AS string)
      ELSE
      SUBSTR(o2.calmonth, 5, 2)
    END
      , '-01') mmonth_date,
    CONCAT(CASE
        WHEN CAST(SUBSTR(o2.calmonth, 5, 2) AS int64)<10 THEN CAST(FORMAT("0%d",CAST(SUBSTR(o2.calmonth, 5, 2) AS int64)) AS string)
      ELSE
      SUBSTR(o2.calmonth, 5, 2)
    END
      ,'/', SUBSTR(o2.calmonth, 0, 4)) month_year,
  FROM
    `cp-cdo-prod-atlas.analytics_batch_actuals.actuals_LA` o2 ),

actuals_stage_la AS (
  SELECT
    SUM(std_cases) AS std_cases,
    SUM(total_tons) AS total_tons,
    SUM(total_pieces) AS total_pieces,
    SUM(total_liters) AS total_liters,
    SUM(gross_sales) AS gross_sales,
    SUM(special_pack_fg) AS special_pack_fg,
    SUM(free_goods_cons) AS free_goods_cons,
    SUM(off_labels) AS off_labels,
    SUM(bonus_packs) AS bonus_packs,
    SUM(coupons) AS coupons,
    SUM(co_reb_pay) AS co_reb_pay,
    SUM(permanent_price_red) AS permanent_price_red,
    SUM(temporary_price_red) AS temporary_price_red,
    SUM(tpr_w_wdrwl_exfact) AS tpr_w_wdrwl_exfact,
    SUM(every_day_low_price) AS every_day_low_price,
    SUM(closeouts) AS closeouts,
    SUM(inventory_price_pro) AS inventory_price_pro,
    SUM(prompt_payment) AS prompt_payment,
    SUM(efficient_logistics) AS efficient_logistics,
    SUM(efficient_management) AS efficient_management,
    SUM(customer_promotions) AS customer_promotions,
    SUM(cust_promo_fixed_overabove) AS cust_promo_fixed_overabove,
    SUM(assortment) AS assortment,
    SUM(growth_direct) AS growth_direct,
    SUM(new_product_incent) AS new_product_incent,
    SUM(middleman_perform) AS middleman_perform,
    SUM(middleman_infrastruc) AS middleman_infrastruc,
    SUM(growth_indirect) AS growth_indirect,
    SUM(indir_retailer_inv) AS indir_retailer_inv,
    SUM(indir_retailer_inv_total) AS indir_retailer_inv_total,
    SUM(in_store_support_indirect) AS in_store_support_indirect,
    SUM(trade_loads) AS trade_loads,
    SUM(listing_allowances) AS listing_allowances,
    SUM(nonperf_trade_pay) AS nonperf_trade_pay,
    SUM(continuity_discounts) AS continuity_discounts,
    SUM(all_oth_cust_disc) AS all_oth_cust_disc,
    SUM(invoiced_sales) AS invoiced_sales,
    SUM(net_sales) AS net_sales,
    SUM(shopper_marketing) AS shopper_marketing,
    SUM(consumer_investment) AS consumer_investment,
    SUM(prcnt_consumer_investment) AS prcnt_consumer_investment,
    SUM(prcnt_consumer_investment_excl_ppr) AS prcnt_consumer_investment_excl_ppr,
    SUM(tpr_oi) AS tpr_oi,
    SUM(tpr_deferred) AS tpr_deferred,
    SUM(tpr_scan) AS tpr_scan,
    SUM(gross_to_net) AS gross_to_net,
    SUM(gross_to_net_prcnt) AS gross_to_net_prcnt,
    SUM(gross_to_net_excl_ppr_prcnt) AS gross_to_net_excl_ppr_prcnt,
    SUM(cust_promo_terms) AS cust_promo_terms,
    SUM(customer_promo_coop_adv_prcnt) AS customer_promo_coop_adv_prcnt,
    SUM(customer_investment) AS customer_investment,
    SUM(prcnt_customer_investment) AS prcnt_customer_investment,
    SUM(customer_promo_coop_adv) AS customer_promo_coop_adv,
    SUM(trade_spend) AS trade_spend,
    SUM(kam_controlled) AS kam_controlled,
    SUM(free_goods_to_trade) AS free_goods_to_trade,
    SUM(free_goods_indirect) AS free_goods_indirect,
    SUM(total_variable_cost) AS total_variable_cost,
    SUM(standard_cost) AS standard_cost,
    SUM(all_other_variable_cost) AS all_other_variable_cost,
    SUM(standard_margin) AS standard_margin,
    SUM(prcnt_standard_margin) AS prcnt_standard_margin,
    SUM(financial_margin) AS financial_margin,
    SUM(prcnt_financial_margin) AS prcnt_financial_margin,
    SUM(asp_case) AS asp_case,
    SUM(asp_pounds) AS asp_pounds,
    SUM(asp_std_case) AS asp_std_case,
    SUM(asp_ton) AS asp_ton,
    SUM(asp_eaches) AS asp_eaches,
    SUM(asp_liters) AS asp_liters,
    SUM(asp_pieces) AS asp_pieces,
    SUM(total_rpc) AS total_rpc,
    SUM(customer_rpc) AS customer_rpc,
    SUM(consumer_rpc) AS consumer_rpc,
    SUM(total_rpc_tons) AS total_rpc_tons,
    SUM(consumer_rpc_tons) AS consumer_rpc_tons,
    SUM(customer_rpc_tons) AS customer_rpc_tons,
    SUM(total_rpc_pieces_selling_units) AS total_rpc_pieces_selling_units,
    SUM(consumer_rpc_pieces_selling_units) AS consumer_rpc_pieces_selling_units,
    SUM(customer_rpc_pieces_selling_units) AS customer_rpc_pieces_selling_units,
    SUM(total_rpc_eaches) AS total_rpc_eaches,
    SUM(consumer_rpc_eaches) AS consumer_rpc_eaches,
    SUM(customer_rpc_eaches) AS customer_rpc_eaches,
    SUM(total_eaches_consumer_units) AS total_eaches_consumer_units,
    SUM(returns_and_taxes) AS returns_and_taxes,
    SUM(sales_and_excise_taxes) AS sales_and_excise_taxes,
    SUM(sales_and_excise_tax_prcnt) AS sales_and_excise_tax_prcnt,
    SUM(sales_returns) AS sales_returns,
    SUM(adjusted_gross_sales) AS adjusted_gross_sales,
    SUM(prompt_payment_oi) AS prompt_payment_oi,
    SUM(efficient_logistics_oi) AS efficient_logistics_oi,
    SUM(efficient_management_deferred) AS efficient_management_deferred,
    SUM(customer_promo_in_store) AS customer_promo_in_store,
    SUM(coop_adv_fixed) AS coop_adv_fixed,
    SUM(coop_adv_variable) AS coop_adv_variable,
    SUM(in_store_promo_trade) AS in_store_promo_trade,
    SUM(total_volume_sales_uom) AS total_volume_sales_uom,
    SUM(total_volume_base_uom) AS total_volume_base_uom,
    SUM(claim_sales) AS claim_sales,
    SUM(couponstrade) AS couponstrade,
    SUM(couponssales) AS couponssales,
    SUM(total_volume_pounds) AS total_volume_pounds,
    SUM(simplified_planning_cons_inv) AS simplified_planning_cons_inv,
    SUM(prcnt_simplified_planning_cons_inv) AS prcnt_simplified_planning_cons_inv,
    SUM(simplified_planning_cust_inv) AS simplified_planning_cust_inv,
    SUM(prcnt_simplified_planning_cust_inv) AS prcnt_simplified_planning_cust_inv,
    SUM(simplified_planning_logistics_prompt_pay) AS simplified_planning_logistics_prompt_pay,
    SUM(prcnt_simplified_planning_logistics_prompt_pay) AS prcnt_simplified_planning_logistics_prompt_pay,
    SUM(prcnt_new_product_incent) AS prcnt_new_product_incent,
    SUM(incremental_display_cost) AS incremental_display_cost,
    SUM(prcnt_incremental_display_cost) AS prcnt_incremental_display_cost,
    SUM(nvo) AS nvo,
    SUM(prcnt_nvo) AS prcnt_nvo,
    SUM(media) AS media,
    SUM(prcnt_media) AS prcnt_media,
    SUM(promotion) AS promotion,
    SUM(prcnt_total_promotion) AS prcnt_total_promotion,
    SUM(promtion_less_incremental_display_cost) AS promtion_less_incremental_display_cost,
    SUM(standard_operating_cost) AS standard_operating_cost,
    SUM(prcnt_standard_operating_cost) AS prcnt_standard_operating_cost,
    SUM(financial_operating_cost) AS financial_operating_cost,
    SUM(prcnt_financial_operating_cost) AS prcnt_financial_operating_cost,
    years,
    month,
    calmonth,
    mmonth_date,
    month_year,
    salesorg,
    Promo_Ind,
    mat_sales,
    cust_sales,
    plant
  FROM
    actuals_stage
  GROUP BY
    years,
    month,
    calmonth,
    mmonth_date,
    month_year,
    salesorg,
    Promo_Ind,
    cust_sales,
    mat_sales,
    plant ),

  actual_stage_la_final AS (
  SELECT
    *
  FROM
    actuals_stage_la UNPIVOT(KeyFigureValue FOR key_figure IN ( std_cases AS 'Std Cases',
        total_tons AS 'Total Tons',
        total_pieces AS 'Total Pieces',
        total_liters AS 'Total Liters',
        gross_sales AS 'Gross Sales',
        special_pack_fg AS 'Special Pack / Fg',
        free_goods_cons AS "Free Goods - Cons",
        off_labels AS "Off Labels",
        bonus_packs AS "Bonus Packs",
        coupons AS 'Coupons',
        co_reb_pay AS 'C&O - Reb / Pay',
        permanent_price_red AS 'Permanent Price Red',
        temporary_price_red AS 'Temporary Price Red',
        tpr_w_wdrwl_exfact AS 'TPR W / Wdrwl, Exfact',
        every_day_low_price AS 'Every Day Low Price',
        closeouts AS 'Closeouts',
        inventory_price_pro AS 'Inventory Price Pro',
        prompt_payment AS 'Prompt Payment',
        efficient_logistics AS 'Efficient Logistics',
        efficient_management AS 'Efficient Management',
        customer_promotions AS 'Customer Promotions',
        cust_promo_fixed_overabove AS 'Cust Promo - Fixed, Over&Above',
        assortment AS 'Assortment',
        growth_direct AS 'Growth (Direct)',
        new_product_incent AS 'New Product Incent',
        middleman_perform AS 'Channel Intermediary Perform',
        middleman_infrastruc AS 'Channel Intermediary Infrastruc',
        growth_indirect AS 'Growth (Indirect)',
        indir_retailer_inv AS 'Indir. Retailer Inv',
        indir_retailer_inv_total AS 'Indir. Retailer Inv. Total',
        in_store_support_indirect AS 'In Store Support - Indirect',
        trade_loads AS 'Trade Loads',
        listing_allowances AS 'Listing Allowances',
        nonperf_trade_pay AS 'Non-Perf. Trade Pay',
        continuity_discounts AS 'Continuity Discounts',
        all_oth_cust_disc AS 'All Oth. Cust. Disc',
        invoiced_sales AS 'Invoiced Sales',
        net_sales AS 'Net Sales',
        shopper_marketing AS 'Shopper Marketing',
        consumer_investment AS 'Consumer Investment',
        prcnt_consumer_investment AS '% Consumer Investment',
        prcnt_consumer_investment_excl_ppr AS '% Consumer Investment excl PPR',
        tpr_oi AS 'TPR - OI',
        tpr_deferred AS 'TPR - Deferred',
        tpr_scan AS 'TPR - Scan',
        gross_to_net AS 'Gross To Net',
        gross_to_net_prcnt AS 'Gross To Net %',
        gross_to_net_excl_ppr_prcnt AS 'Gross To Net excl PPR %',
        cust_promo_terms AS 'Cust Promo - Terms',
        customer_promo_coop_adv_prcnt AS 'Customer Promo / Coop Adv %',
        customer_investment AS 'Customer Investment',
        prcnt_customer_investment AS '% Customer Investment',
        customer_promo_coop_adv AS 'Customer Promo / Coop Adv',
        trade_spend AS 'Trade Spend',
        kam_controlled AS 'KAM Controlled',
        free_goods_to_trade AS 'Free Goods To Trade',
        free_goods_indirect AS 'Free Goods (Indirect)',
        total_variable_cost AS 'Total Variable Cost',
        standard_cost AS 'Standard Cost',
        all_other_variable_cost AS 'All Other Variable Cost',
        standard_margin AS 'Standard Margin',
        prcnt_standard_margin AS '% Standard Margin',
        financial_margin AS 'Financial Margin',
        prcnt_financial_margin AS '% Financial Margin',
        asp_case AS 'ASP / Case',
        asp_pounds AS 'ASP / Pounds',
        asp_std_case AS 'ASP / Std Case',
        asp_ton AS 'ASP / Ton',
        asp_eaches AS 'ASP / Eaches',
        asp_liters AS 'ASP / Liters',
        asp_pieces AS 'ASP / Pieces',
        total_rpc AS 'Total RPC',
        customer_rpc AS 'Customer RPC',
        consumer_rpc AS 'Consumer RPC',
        total_rpc_tons AS 'Total RPC - Tons',
        consumer_rpc_tons AS 'Consumer RPC - Tons',
        customer_rpc_tons AS 'Customer RPC - Tons',
        total_rpc_pieces_selling_units AS 'Total RPC - Pieces (Selling Units)',
        consumer_rpc_pieces_selling_units AS 'Consumer RPC - Pieces (Selling Units)',
        customer_rpc_pieces_selling_units AS 'Customer RPC - Pieces (Selling Units)',
        total_rpc_eaches AS 'Total RPC - Eaches',
        consumer_rpc_eaches AS 'Consumer RPC - Eaches',
        customer_rpc_eaches AS 'Customer RPC - Eaches',
        total_eaches_consumer_units AS 'Total Eaches (Consumer Units)',
        returns_and_taxes AS 'Returns And Taxes',
        sales_and_excise_taxes AS 'Sales And Excise Taxes',
        sales_and_excise_tax_prcnt AS 'Sales And Excise Tax %',
        sales_returns AS 'Sales Returns',
        adjusted_gross_sales AS 'Adjusted Gross Sales',
        prompt_payment_oi AS 'Prompt Payment - OI',
        efficient_logistics_oi AS 'Efficient Logistics - OI',
        efficient_management_deferred AS 'Efficient Management - Deferred',
        customer_promo_in_store AS 'Customer Promo / In Store',
        coop_adv_fixed AS 'Coop Adv Fixed',
        coop_adv_variable AS 'Coop Adv Variable',
        in_store_promo_trade AS 'In Store Promo - Trade',
        total_volume_sales_uom AS 'Total Volume (Sales UoM)',
        total_volume_base_uom AS 'Total Volume (Base UoM)',
        claim_sales AS 'Claim Sales',
        couponstrade AS 'Coupons-Trade',
        couponssales AS 'Coupons-Sales',
        total_volume_pounds AS 'Total Volume (Pounds)',
        simplified_planning_cons_inv AS 'Simplified Planning Cons Inv',
        prcnt_simplified_planning_cons_inv AS '% Simplified Planning Cons Inv',
        simplified_planning_cust_inv AS 'Simplified Planning Cust Inv',
        prcnt_simplified_planning_cust_inv AS '% Simplified Planning Cust Inv',
        simplified_planning_logistics_prompt_pay AS 'Simplified Planning Logistics/Prompt Pay',
        prcnt_simplified_planning_logistics_prompt_pay AS '% Simplified Planning Logistics/Prompt Pay',
        prcnt_new_product_incent AS '% New Product Incent',
        incremental_display_cost AS 'Incremental Display Cost',
        prcnt_incremental_display_cost AS '% Incremental Display Cost',
        nvo AS 'Nvo',
        prcnt_nvo AS '% NVO',
        media AS 'Media',
        prcnt_media AS '% Media',
        promotion AS 'Total Promotion',
        prcnt_total_promotion AS '% Total Promotion',
        promtion_less_incremental_display_cost AS 'Promotion less incr. display',
        standard_operating_cost AS 'Standard Operating Profit',
        prcnt_standard_operating_cost AS '% Standard Operating Profit',
        financial_operating_cost AS 'Financial Operating Profit',
        prcnt_financial_operating_cost AS '% Financial Operating Profit' ))
    WHERE
      CASE
        WHEN key_figure IN ('% Consumer Investment', '% Consumer Investment excl PPR', '% Customer Investment', 'Gross To Net %', 'Gross To Net excl PPR %', '% Standard Margin', '% Financial Margin') THEN TRUE
      ELSE IFNULL(KeyFigureValue, 0) <> 0
    END
      AND IFNULL(key_figure, '') <> '' ),
  
calmonth_generate AS (
  SELECT
    CONCAT(Year, LPAD(CAST(Month AS STRING), 2, '0')) AS calmonth
  FROM (
    SELECT
      CAST(EXTRACT(YEAR
        FROM
          CURRENT_DATE()) - 2 + FLOOR(num/12) AS INT64) AS Year,
      MOD(num, 12) + 1 AS Month
    FROM
      UNNEST(GENERATE_ARRAY(0, 3*12-1)) AS num ) ),

sle_daterange AS (
  SELECT
    CASE
      WHEN EXTRACT(YEAR FROM CURRENT_DATE()) = CAST(SUBSTR(calmonth, 0, 4) AS INT64) THEN CONCAT(SUBSTR(calmonth, 0, 4), ' Actuals (Monthly YTD)')
    ELSE
    CONCAT(SUBSTR(calmonth, 0, 4), ' Actuals')
  END
    AS SLE_Actual_LE,
    calmonth
  FROM
    calmonth_generate
  WHERE
    CAST(SUBSTR(calmonth, 0, 4) AS INT64) <= EXTRACT(YEAR
    FROM
      CURRENT_DATE())
    AND CAST(CONCAT(SUBSTR(calmonth, 0, 4), '-', SUBSTR(calmonth, 5, 2), '-01') AS date) < CAST(CONCAT(CAST(EXTRACT(YEAR
          FROM
            CURRENT_DATE()) AS STRING), '-',CAST(EXTRACT(MONTH
          FROM
            CURRENT_DATE()) AS STRING), '-01') AS date)
  UNION ALL
  SELECT
    CONCAT(SUBSTR(calmonth, 0, 4), ' Actuals YTD (Monthly)') AS SLE_Actual_LE,
    calmonth
  FROM
    calmonth_generate
  WHERE
    CAST(SUBSTR(calmonth, 0, 4) AS INT64) = EXTRACT(YEAR
    FROM
      CURRENT_DATE()) - 1
    AND CAST(SUBSTR(calmonth, 5, 2) AS INT64) < EXTRACT(MONTH
    FROM
      CURRENT_DATE())
  UNION ALL
  SELECT
    CONCAT(SUBSTR(calmonth, 0, 4), ' SLE') AS SLE_Actual_LE,
    calmonth
  FROM
    calmonth_generate
  WHERE
    CAST(SUBSTR(calmonth, 0, 4) AS INT64) >= EXTRACT(YEAR
    FROM
      CURRENT_DATE())
    AND CAST(SUBSTR(calmonth, 5, 2) AS INT64) < EXTRACT(MONTH
    FROM
      CURRENT_DATE())
  UNION ALL
  SELECT
    CONCAT(SUBSTR(calmonth, 0, 4), ' Actuals (Daily YTD)') AS SLE_Actual_LE,
    calmonth
  FROM
    calmonth_generate
  WHERE
    IFNULL(calmonth, '') <> ''
    AND CAST(SUBSTR(calmonth, 0, 4) AS INT64) = EXTRACT(YEAR
    FROM
      CURRENT_DATE())
    AND CAST(SUBSTR(calmonth, 5, 2) AS INT64) <= EXTRACT(MONTH
    FROM
      CURRENT_DATE()) )
      
SELECT
  custsales.bic_gc_cu_cl,
  custsales.cust_group,
  custsales.cust_h01,
  custsales.cust_h02,
  custsales.cust_h03,
  custsales.cust_h04,
  custsales.cust_h05,
  custsales.cust_h01_desc bic_cust_h01,
  custsales.cust_h02_desc bic_cust_h02,
  custsales.cust_h03_desc bic_cust_h03,
  custsales.cust_h04_desc bic_cust_h04,
  custsales.cust_h05_desc bic_cust_h05,
  custsales.territory_node_level1_description territory_node_level1,
  custsales.territory_node_level2_description territory_node_level2,
  custsales.territory_node_level3_description territory_node_level3,
  custsales.territory_node_level4_description territory_node_level4,
  custsales.territory_node_level5_description territory_node_level5,
  custsales.gc_cu_type_desc bic_gc_cu_typ,
  custsales.division,
  custsales.reporting_division,
  custsales.reporting_region,
  custsales.bic_tam_fundl,
  custsales.gc_chan_desc bic_gc_chan,
  custsales.gc_gl_cust_desc bic_gc_gl_cus,
  custsales.bic_gc_re_mm,
  custsales.sales_dist_desc,
  custsales.salesemply_desc,
  custsales.sales_grp_desc,
  custsales.sales_off_desc,
  custsales.bic_gc_s_team,
  custsales.country_desc country,
  custsales.industry,
  custsales.region_desc region,
  matsales.abckey,
  matsales.sales_uom,
  matsales.base_uom_eanupc,
  matsales.consumer_uom_eanupc,
  matsales.bic_zappln,
  matsales.zbreqty_desc bic_zbreqty,
  matsales.zcategry_mdesc bic_zcategry,
  matsales.zconctra_mdesc,
  matsales.sales_st,
  matsales.sales_st_desc,
  matsales.zflavor_mdesc,
  matsales.mat_grp1_mdesc,
  matsales.mp_flag bic_g_mp_flag,
  matsales.zpacksiz_mdesc,
  matsales.zplatform_mdesc,
  matsales.zprcateg_desc bic_zprcateg,
  matsales.zprodfrm_mdesc bic_zprodfrm,
  matsales.lifestage bic_lifestage,
  matsales.lifestage_desc,
  matsales.zpromflg_mdesc,
  matsales.bic_sku_cat,
  matsales.bic_sku_type,
  matsales.zsubbr_desc bic_zsubbr,
  matsales.zsubcats_mdesc bic_zsubcats,
  matsales.zgpvar_desc bic_zgpvar,
  custsales.salesorg comp_code,
  custsales.country_desc subsidiary,
  la.years,
  la.month,
  --case WHEN CAST(month AS int64)<10 THEN CAST(FORMAT("0%d",CAST(month AS int64)) AS string)  ELSE  CAST(month AS string)END  month,
  la.mmonth_date,
  la.month_year,
  matsales.PPG prod_node_ppg,
  matsales.mat_sales_desc product_description,
  la.salesorg,
  custsales.gc_mn_cust_desc bic_gc_mn_cus,
  custsales.cust_sales_desc cust_sales,
  la.mat_sales,
  custsales.cust_group_custsales_mdesc,
  custsales.region_desc,
  la.key_figure,
  la.KeyFigureValue,
  asle.SLE_Actual_LE,
  custsales.gc_re_mm_desc,
  matsales.mat_sales_desc AS txtmd,
  matsales.PPG_mdesc ppgtext,
  KeyOrder.Sort_Order,
  KeyOrder.Key_DecimalNo,
  matsales.zbreqty,
  matsales.zbreqty_desc,
  matsales.zcategry,
  matsales.zcategry_mdesc,
  matsales.zsubcats,
  matsales.zsubcats_mdesc,
  matsales.zattr2,
  matsales.zattr2_dec,
  matsales.zsubbr,
  matsales.zsubbr_desc,
  matsales.zgpvar,
  matsales.zgpvar_desc,
  matsales.zprcateg,
  matsales.zprcateg_desc,
  cs.id sales_org_id,
  '' AS LEVersion,
  la.Promo_Ind,
  la.plant
FROM
  actual_stage_la_final la
  LEFT JOIN
    `cp-cdo-prod-atlas.analytics_raw.atlas_core_salesorg` cs
  ON
    la.salesorg = cs.sales_org 
  LEFT JOIN
    sle_daterange asle
  ON
    la.calmonth = asle.calmonth
  LEFT JOIN
    `cp-cdo-prod-atlas.analytics_master_data.mat_sales` matsales
  ON
    cs.id = matsales.salesorg_id
    AND la.mat_sales = matsales.mat_sales
  LEFT JOIN
    `cp-cdo-prod-atlas.analytics_master_data.cust_sales` custsales
    ON
      la.cust_sales = custsales.cust_sales
      AND cs.id = custsales.salesorg_id
      AND custsales.division = '99'
  LEFT JOIN
    `cp-cdo-prod-atlas.analytics_reporting.Key_Figure_Order` KeyOrder
      ON
        KeyOrder.Key_Figure = la.key_figure
  WHERE
      CASE
        WHEN asle.SLE_Actual_LE like '%SLE' THEN
          la.key_figure NOT IN ('Financial Margin', '% Financial Margin', 'Financial Operating Profit', '% Financial Operating Profit') 
        
        ELSE TRUE

      END
