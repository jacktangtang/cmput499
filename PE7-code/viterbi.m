function [qstar] = viterbi(O, phi, A, B)
% Given size T observation, O, and HMM parameters corresponding to k states,
% viterbi.m computes and returns qstar vector of size 1*T of most likely
% state interpretation for a given O
%
% Input:
%   O: sequence of Observations (1*T)
%   phi: initial state distribution of HMM (1*k)
%   A: HMM transition matrix (k*k)
%   B: HMM emission matrix (m*k)
%
% Returns:
%   qstar: most likely state interpretation for the given O (1*T)
%
%   See Eqn 32a-35 in Rabiner 1989 for details
T = length(O); % size of observation sequence
m = size(B,1);  % number of possible observed values
k = size(A,1);  % number of possible states
qstar = zeros(1,T);

%Your code goes here
cz(1,:)=[0 ,0];
d(1,:) = phi.*B(O(1),:);

for k=2:T
   
        d_k=transpose(d(k-1,:)).*A(:,1);
        mdk=max(d_k);
        d(k,1)=mdk* B(O(k),1);
        
        for i=1:size(d_k,1)
            if(d_k(i)==mdk)
                cz(k,1)=i;
            end
        end
        
        d_k=transpose(d(k-1,:)).*A(:,2);
        mdk=max(d_k);
        d(k,2)=mdk* B(O(k),2);
        
        for i=1:size(d_k,1)
            if(d_k(i)==mdk)
                cz(k,2)=i;
            end
        end
  
end

pstar=max(d(T,:));
qstar(:,T)=find(d(T,:)==pstar);

for i=T:-1:2
   qstar(:,i-1)=  cz(i, qstar(:,i));
end




end
