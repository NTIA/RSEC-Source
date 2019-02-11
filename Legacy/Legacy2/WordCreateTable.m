function WordCreateTable(actx_word_p,nr_rows_p,nr_cols_p,data_cell_p,enter_p,ColumnHeaders) 
    %Add a table which auto fits cell's size to contents
    if(enter_p(1))
        actx_word_p.Selection.TypeParagraph; %enter
    end
    %create the table
    %Add = handle Add(handle, handle, int32, int32, Variant(Optional))
    actx_word_p.ActiveDocument.Tables.Add(actx_word_p.Selection.Range,(nr_rows_p+1),nr_cols_p,1,0);
    
    %Hard-coded optionals                     
    %first 1 same as DefaultTableBehavior:= wdWord9TableBehavior
    %last  1 same as AutoFitBehavior:= wdAutoFitContent..Change to zero for
    %Table centering...
    
     for j = 1:nr_cols_p %Writes Column headers
     actx_word_p.Selection.Tables.Item(1).Cell(1,j).Range.Text = ColumnHeaders{j};
     end
   
    %write the data into the table
    for r=1:nr_rows_p
        for c=1:nr_cols_p
            %write data into current cell
           
            actx_word_p.Selection.Tables.Item(1).Cell((r+1),c).Range.Text = num2str(data_cell_p{r,c});
                               
            if(r*c==nr_rows_p*nr_cols_p)%we are done, leave the table
                        
                for z = 1:(nr_rows_p+1)
                actx_word_p.Selection.MoveDown;
                end  
           
            end            
        end
    end
return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%