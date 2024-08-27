% Author: Timothy McGee / tam0090@auburn.edu
% Date: 2024-08-26
% Assignment Name: hw00

% The following class defines 3 functions for each problem respectively.
% Please follow the instruction inside each function. 

classdef hw00 
    methods (Static)

        function a_m = p1(m)
            % This function takes an integer m and returns the term a_m in the sequence defined by 
            % a_0 = 0, a_1 = 1, a_2 = 1, and a_n = a_{n-1} + a_{n-2} + a_{n-3} for n >= 3.
            % :param m: an integer
            % :return: the m-th term in the sequence

            if m < 0
                error('m must be a non-negative integer')
            elseif m == 0     %Set initial conditions
                a_m = 0;  

            elseif m == 1
                a_m = 1;
            
            elseif m == 2
                a_m = 1;
            
            else

                a_0 = 0;       
                a_1 = 1;
                a_2 = 1;

                for n = 3:m               %computation
                    a_m = a_0 + a_1 + a_2;

                    a_0 = a_1;              %Update vars
                    a_1 = a_2;
                    a_2 = a_m;

                end
                
            end

        end


        function det_A = p2(A)
            % This function takes a matrix A of size n x n and returns the determinant of A.
            % :param A: a matrix of size n x n
            % :return: the determinant of A

            if size(A,1) ~= size(A,2)
                error('A must be a square matrix')
            end
            det_A = 0;                                     %Initialize vars
            n = length(A);                                 
            if n == 1                                      %Check conditions
                det_A = A(1,1);

            elseif n == 2
                det_A = (A(1,1)*A(2,2) - A(1,2)*A(2,1));

            else
                for i = 1 : n                             
                    M = A(2:end, [1:i-1, i+1:end]);          %Define "minor" matrix. Had to youtube how to do laplace :(
                    CF = A(1, i) * ((-1)^(1 + i)) * hw00.p2(M);     %Coafactor computation
                   det_A = det_A + CF;
                end

            end
        end



        function p3()
            % This function should have a run time about 1 second.
            % :return: no returns

            % Write your code here
            tic; 
            pause(0.9994);              %Chat GPT introduced me to this function
            toc;
        end
    end
   
end

%ChatGPT and Matlab "Help" were used during the duration of this assignment
%soley to assist with matlab coding language. I look forward to growing my
%understanding for the language as the semester advances. 