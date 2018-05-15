class PollingAgentPageController < ApplicationController
  def index
    
    @total_votes =  VoteResult.count(:voter_id) / 5
    @total_tokens = VoterToken.count(:voter_id)
    @total_tokens_used = VoterToken.where(active_status: false).count(:voter_id)
    @total_reg_voters  = RegisteredVoter.where(active_status: true).count(:voter_id)
    
    
    # President result
    @vote_cast_for_prez = VoteResult.where('portfolio_id =? OR portfolio_id =?', 'P', 'P_NONE').count(:voter_id) 
    @total_valid_votes_for_prez = VoteResult.where(portfolio_id: 'P').count(:portfolio_id)
    @total_rejected_vote_for_prez = VoteResult.where(portfolio_id: 'P_NONE').count(:portfolio_id)
    
    @reject_per = (@total_rejected_vote_for_prez.to_f / @vote_cast_for_prez)* 100
    @reject_per_final = '%.2f' % @reject_per
    @valid_prez = (@total_valid_votes_for_prez.to_f / @vote_cast_for_prez)* 100
    @valid_prez_final = '%.2f' % @valid_prez 
      
    # Slot 1
    @results_prez1 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'P', slot: 1)
    if @results_prez1.present?
      @count_prez1 = @results_prez1.count(:candidate_id)
    else
      @count_prez1 = 0
    end    
    @candidate1 = CandidateMaster.where(portfolio_id: 'P', slot_id: 1)[0]
    
    @prez1_per = (@count_prez1.to_f / @vote_cast_for_prez) * 100
    @prez1_per_final = '%.2f' % @prez1_per
    
    # Slot 2
    @results_prez2 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'P', slot: 2)
    if @results_prez2.present?
      @count_prez2 = @results_prez2.count(:candidate_id)
    else
      @count_prez2 = 0
    end      
    @candidate2 = CandidateMaster.where(portfolio_id: 'P', slot_id: 2)[0]
    @prez2_per = (@count_prez2.to_f/ @vote_cast_for_prez)* 100
    @prez2_per_final = '%.2f' % @prez2_per
       
    # Slot 3
    @results_prez3 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'P', slot: 3)
    if @results_prez3.present?
      @count_prez3 = @results_prez3.count(:candidate_id)
    else
      @count_prez3 = 0
    end 
    @candidate3 = CandidateMaster.where(portfolio_id: 'P', slot_id: 3)[0]
    @prez3_per = (@count_prez3.to_f/ @vote_cast_for_prez) * 100
    @prez3_per_final = '%.2f' % @prez3_per
    
    
    # Slot 4
    @results_prez4 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'P', slot: 4)
    if @results_prez4.present?
      @count_prez4 = @results_prez4.count(:candidate_id)
    else
      @count_prez4 = 0
    end 
    @candidate4 = CandidateMaster.where(portfolio_id: 'P', slot_id: 4)[0]
    @prez4_per = (@count_prez4.to_f/ @vote_cast_for_prez) * 100
    @prez4_per_final = '%.2f' % @prez4_per
    
    # Slot 5
    @results_prez5 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'P', slot: 5)
    if @results_prez5.present?
      @count_prez5 = @results_prez5.count(:candidate_id)
    else
      @count_prez5 = 0
    end 
    @candidate5 = CandidateMaster.where(portfolio_id: 'P', slot_id: 5)[0]
    @prez5_per = (@count_prez5.to_f/ @vote_cast_for_prez) * 100
    @prez5_per_final = '%.2f' % @prez5_per
    
    # Slot 6
    @results_prez6 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'P', slot: 6)
    if @results_prez6.present?
      @count_prez6 = @results_prez6.count(:candidate_id)
    else
      @count_prez6 = 0
    end 
    @candidate6 = CandidateMaster.where(portfolio_id: 'P', slot_id: 6)[0]
    @prez6_per = (@count_prez6.to_f/ @vote_cast_for_prez) * 100
    @prez6_per_final = '%.2f' % @prez6_per
   # end of president result
   
   
   
   
   # secretary result
   @vote_cast_for_sec = VoteResult.where('portfolio_id =? OR portfolio_id =?', 'S', 'SEC_NONE').count(:voter_id)
   @total_valid_votes_for_sec = VoteResult.where(portfolio_id: 'S').count(:portfolio_id)
   @total_rejected_vote_for_sec = VoteResult.where(portfolio_id: 'SEC_NONE').count(:portfolio_id)
   
    @reject_per_sec = (@total_rejected_vote_for_sec.to_f / @vote_cast_for_sec)* 100
    @reject_per_final_sec = '%.2f' % @reject_per_sec
    @valid_sec = (@total_valid_votes_for_sec.to_f / @vote_cast_for_sec)* 100
    @valid_sec_final = '%.2f' % @valid_sec
    
     # Slot 1
    @results_sec1 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'S', slot: 1)
    if @results_sec1.present?
      @count_sec1 = @results_sec1.count(:candidate_id)
    else
      @count_sec1 = 0
    end    
    @candidate_sec1 = CandidateMaster.where(portfolio_id: 'S', slot_id: 1)[0]
    
    @sec1_per = (@count_sec1.to_f / @vote_cast_for_sec) * 100
    @sec1_per_final = '%.2f' % @sec1_per
    
    # Slot 2
    @results_sec2 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'S', slot: 2)
    if @results_sec2.present?
      @count_sec2 = @results_sec2.count(:candidate_id)
    else
      @count_sec2 = 0
    end      
    @candidate_sec2 = CandidateMaster.where(portfolio_id: 'S', slot_id: 2)[0]
    @sec2_per = (@count_sec2.to_f/ @vote_cast_for_sec)* 100
    @sec2_per_final = '%.2f' % @sec2_per
       
    # Slot 3
    @results_sec3 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'S', slot: 3)
    if @results_sec3.present?
      @count_sec3 = @results_sec3.count(:candidate_id)
    else
      @count_sec3 = 0
    end 
    @candidate_sec3 = CandidateMaster.where(portfolio_id: 'S', slot_id: 3)[0]
    @sec3_per = (@count_sec3.to_f/ @vote_cast_for_sec) * 100
    @sec3_per_final = '%.2f' % @sec3_per
    
    
    # Slot 4
    @results_sec4 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'S', slot: 4)
    if @results_sec4.present?
      @count_sec4 = @results_sec4.count(:candidate_id)
    else
      @count_sec4 = 0
    end 
    @candidate_sec4 = CandidateMaster.where(portfolio_id: 'S', slot_id: 4)[0]
    @sec4_per = (@count_sec4.to_f/ @vote_cast_for_sec) * 100
    @sec4_per_final = '%.2f' % @sec4_per
    
    # Slot 5
    @results_sec5 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'S', slot: 5)
    if @results_sec5.present?
      @count_sec5 = @results_sec5.count(:candidate_id)
    else
      @count_sec5 = 0
    end 
    @candidate_sec5 = CandidateMaster.where(portfolio_id: 'S', slot_id: 5)[0]
    @sec5_per = (@count_sec5.to_f/ @vote_cast_for_sec) * 100
    @sec5_per_final = '%.2f' % @sec5_per
    
    # Slot 6
    @results_sec6 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'S', slot: 6)
    if @results_sec6.present?
      @count_sec6 = @results_sec6.count(:candidate_id)
    else
      @count_sec6 = 0
    end 
    @candidate_sec6 = CandidateMaster.where(portfolio_id: 'S', slot_id: 6)[0]
    @sec6_per = (@count_sec6.to_f/ @vote_cast_for_sec) * 100
    @sec6_per_final = '%.2f' % @sec6_per
   
     
   # Treasure results
   @vote_cast_for_tr = VoteResult.where('portfolio_id =? OR portfolio_id =?', 'TR', 'TR_NONE').count(:voter_id)
   @total_valid_votes_for_tr = VoteResult.where(portfolio_id: 'TR').count(:portfolio_id)
   @total_rejected_vote_for_tr = VoteResult.where(portfolio_id: 'TR_NONE').count(:portfolio_id)
   
    @reject_per_tr = (@total_rejected_vote_for_tr.to_f / @vote_cast_for_tr)* 100
    @reject_per_final_tr = '%.2f' % @reject_per_tr
    @valid_tr = (@total_valid_votes_for_tr.to_f / @vote_cast_for_tr)* 100
    @valid_tr_final = '%.2f' % @valid_tr
  
   # Slot 1
    @results_tr1 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'TR', slot: 1)
    if @results_tr1.present?
      @count_tr1 = @results_tr1.count(:candidate_id)
    else
      @count_tr1 = 0
    end    
    @candidate_tr1 = CandidateMaster.where(portfolio_id: 'TR', slot_id: 1)[0]
    
    @tr1_per = (@count_tr1.to_f / @vote_cast_for_tr) * 100
    @tr1_per_final = '%.2f' % @tr1_per
    
    # Slot 2
    @results_tr2 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'TR', slot: 2)
    if @results_tr2.present?
      @count_tr2 = @results_tr2.count(:candidate_id)
    else
      @count_tr2 = 0
    end      
    @candidate_tr2 = CandidateMaster.where(portfolio_id: 'TR', slot_id: 2)[0]
    @tr2_per = (@count_tr2.to_f/ @vote_cast_for_tr)* 100
    @tr2_per_final = '%.2f' % @tr2_per
       
    # Slot 3
    @results_tr3 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'TR', slot: 3)
    if @results_tr3.present?
      @count_tr3 = @results_tr3.count(:candidate_id)
    else
      @count_tr3 = 0
    end 
    @candidate_tr3 = CandidateMaster.where(portfolio_id: 'TR', slot_id: 3)[0]
    @tr3_per = (@count_tr3.to_f/ @vote_cast_for_tr) * 100
    @tr3_per_final = '%.2f' % @tr3_per
    
    
    # Slot 4
    @results_tr4 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'TR', slot: 4)
    if @results_tr4.present?
      @count_tr4 = @results_tr4.count(:candidate_id)
    else
      @count_tr4 = 0
    end 
    @candidate_tr4 = CandidateMaster.where(portfolio_id: 'TR', slot_id: 4)[0]
    @tr4_per = (@count_tr4.to_f/ @vote_cast_for_tr) * 100
    @tr4_per_final = '%.2f' % @tr4_per
    
    # Slot 5
    @results_tr5 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'TR', slot: 5)
    if @results_tr5.present?
      @count_tr5 = @results_tr5.count(:candidate_id)
    else
      @count_tr5 = 0
    end 
    @candidate_tr5 = CandidateMaster.where(portfolio_id: 'TR', slot_id: 5)[0]
    @tr5_per = (@count_tr5.to_f/ @vote_cast_for_tr) * 100
    @tr5_per_final = '%.2f' % @tr5_per
    
    # Slot 6
    @results_tr6 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'TR', slot: 6)
    if @results_tr6.present?
      @count_tr6 = @results_tr6.count(:candidate_id)
    else
      @count_tr6 = 0
    end 
    @candidate_tr6 = CandidateMaster.where(portfolio_id: 'TR', slot_id: 6)[0]
    @tr6_per = (@count_tr6.to_f/ @vote_cast_for_tr) * 100
    @tr6_per_final = '%.2f' % @tr6_per
   
   
   
   # Finanacial Secretary result
    @vote_cast_for_fs = VoteResult.where('portfolio_id =? OR portfolio_id =?', 'FS', 'FS_NONE').count(:voter_id)
    @total_valid_votes_for_fs = VoteResult.where(portfolio_id: 'FS').count(:portfolio_id)
    @total_rejected_vote_for_fs = VoteResult.where(portfolio_id: 'FS_NONE').count(:portfolio_id)
   
    @reject_per_fs = (@total_rejected_vote_for_fs.to_f / @vote_cast_for_fs)* 100
    @reject_per_final_fs = '%.2f' % @reject_per_fs
    @valid_fs = (@total_valid_votes_for_fs.to_f / @vote_cast_for_fs)* 100
    @valid_fs_final = '%.2f' % @valid_fs
   
    # Slot 1
    @results_fs1 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'FS', slot: 1)
    if @results_fs1.present?
      @count_fs1 = @results_fs1.count(:candidate_id)
    else
      @count_fs1 = 0
    end    
    @candidate_fs1 = CandidateMaster.where(portfolio_id: 'FS', slot_id: 1)[0]
    
    @fs1_per = (@count_fs1.to_f / @vote_cast_for_fs) * 100
    @fs1_per_final = '%.2f' % @fs1_per
    
    # Slot 2
    @results_fs2 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'FS', slot: 2)
    if @results_fs2.present?
      @count_fs2 = @results_fs2.count(:candidate_id)
    else
      @count_fs2 = 0
    end      
    @candidate_fs2 = CandidateMaster.where(portfolio_id: 'FS', slot_id: 2)[0]
    @fs2_per = (@count_fs2.to_f/ @vote_cast_for_fs)* 100
    @fs2_per_final = '%.2f' % @fs2_per
       
    # Slot 3
    @results_fs3 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'FS', slot: 3)
    if @results_fs3.present?
      @count_fs3 = @results_fs3.count(:candidate_id)
    else
      @count_fs3 = 0
    end 
    @candidate_fs3 = CandidateMaster.where(portfolio_id: 'FS', slot_id: 3)[0]
    @fs3_per = (@count_fs3.to_f/ @vote_cast_for_fs) * 100
    @fs3_per_final = '%.2f' % @fs3_per
    
    
    # Slot 4
    @results_fs4 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'FS', slot: 4)
    if @results_fs4.present?
      @count_fs4 = @results_fs4.count(:candidate_id)
    else
      @count_fs4 = 0
    end 
    @candidate_fs4 = CandidateMaster.where(portfolio_id: 'FS', slot_id: 4)[0]
    @fs4_per = (@count_fs4.to_f/ @vote_cast_for_fs) * 100
    @fs4_per_final = '%.2f' % @fs4_per
    
    # Slot 5
    @results_fs5 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'FS', slot: 5)
    if @results_fs5.present?
      @count_fs5 = @results_fs5.count(:candidate_id)
    else
      @count_fs5 = 0
    end 
    @candidate_fs5 = CandidateMaster.where(portfolio_id: 'FS', slot_id: 5)[0]
    @fs5_per = (@count_fs5.to_f/ @vote_cast_for_fs) * 100
    @fs5_per_final = '%.2f' % @fs5_per
    
    # Slot 6
    @results_fs6 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'FS', slot: 6)
    if @results_fs6.present?
      @count_fs6 = @results_fs6.count(:candidate_id)
    else
      @count_fs6 = 0
    end 
    @candidate_fs6 = CandidateMaster.where(portfolio_id: 'FS', slot_id: 6)[0]
    @fs6_per = (@count_fs6.to_f/ @vote_cast_for_fs) * 100
    @fs6_per_final = '%.2f' % @fs6_per
   
   
   
   # Wocom result
    @vote_cast_for_wc = VoteResult.where('portfolio_id =? OR portfolio_id =?', 'WC', 'WC_NONE').count(:voter_id)
    @total_valid_votes_for_wc = VoteResult.where(portfolio_id: 'WC').count(:portfolio_id)
    @total_rejected_vote_for_wc = VoteResult.where(portfolio_id: 'WC_NONE').count(:portfolio_id)
   
    @reject_per_wc = (@total_rejected_vote_for_wc.to_f / @vote_cast_for_wc)* 100
    @reject_per_final_wc = '%.2f' % @reject_per_wc
    @valid_wc = (@total_valid_votes_for_wc.to_f / @vote_cast_for_wc)* 100
    @valid_wc_final = '%.2f' % @valid_wc
    
     # Slot 1
    @results_wc1 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'WC', slot: 1)
    if @results_wc1.present?
      @count_wc1 = @results_wc1.count(:candidate_id)
    else
      @count_wc1 = 0
    end    
    @candidate_wc1 = CandidateMaster.where(portfolio_id: 'WC', slot_id: 1)[0]
    
    @wc1_per = (@count_wc1.to_f / @vote_cast_for_wc) * 100
    @wc1_per_final = '%.2f' % @wc1_per
    
    # Slot 2
    @results_wc2 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'WC', slot: 2)
    if @results_wc2.present?
      @count_wc2 = @results_wc2.count(:candidate_id)
    else
      @count_wc2 = 0
    end      
    @candidate_wc2 = CandidateMaster.where(portfolio_id: 'WC', slot_id: 2)[0]
    @wc2_per = (@count_wc2.to_f/ @vote_cast_for_wc)* 100
    @wc2_per_final = '%.2f' % @wc2_per
       
    # Slot 3
    @results_wc3 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'WC', slot: 3)
    if @results_wc3.present?
      @count_wc3 = @results_wc3.count(:candidate_id)
    else
      @count_wc3 = 0
    end 
    @candidate_wc3 = CandidateMaster.where(portfolio_id: 'WC', slot_id: 3)[0]
    @wc3_per = (@count_wc3.to_f/ @vote_cast_for_wc) * 100
    @wc3_per_final = '%.2f' % @wc3_per
    
    
    # Slot 4
    @results_wc4 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'WC', slot: 4)
    if @results_wc4.present?
      @count_wc4 = @results_wc4.count(:candidate_id)
    else
      @count_wc4 = 0
    end 
    @candidate_wc4 = CandidateMaster.where(portfolio_id: 'WC', slot_id: 4)[0]
    @wc4_per = (@count_wc4.to_f/ @vote_cast_for_wc) * 100
    @wc4_per_final = '%.2f' % @wc4_per
    
    # Slot 5
    @results_wc5 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'WC', slot: 5)
    if @results_wc5.present?
      @count_wc5 = @results_wc5.count(:candidate_id)
    else
      @count_wc5 = 0
    end 
    @candidate_wc5 = CandidateMaster.where(portfolio_id: 'WC', slot_id: 5)[0]
    @wc5_per = (@count_wc5.to_f/ @vote_cast_for_wc) * 100
    @wc5_per_final = '%.2f' % @wc5_per
    
    # Slot 6
    @results_wc6 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'WC', slot: 6)
    if @results_wc6.present?
      @count_wc6 = @results_wc6.count(:candidate_id)
    else
      @count_wc6 = 0
    end 
    @candidate_wc6 = CandidateMaster.where(portfolio_id: 'WC', slot_id: 6)[0]
    @wc6_per = (@count_wc6.to_f/ @vote_cast_for_wc) * 100
    @wc6_per_final = '%.2f' % @wc6_per
    
  end
end
