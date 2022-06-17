meta def few_shot_prompt : string :=
"/-- If $z_1, \\dots, z_n$ are complex, 
  then $|z_1 + z_2 + \\dots + z_n|\\leq |z_1| + |z_2| + \\dots + |z_n|$. -/
theorem abs_sum_leq_sum_abs (n : ℕ) (f : ℕ → ℂ) :
  abs (∑ i in finset.range n, f i) ≤ ∑ i in finset.range n, abs (f i) := sorry
  
/-- If x and y are in $\\mathbb{R}^n$, then $|x+y|^2 + |x-y|^2 = 2|x|^2 + 2|y|^2$. -/
theorem sum_add_square_sub_square_eq_sum_square (n : ℕ) (x y : euclidean_space ℝ (fin n)) :
  ∥x + y∥^2 + ∥x - y∥^2 = 2*∥x∥^2 + 2*∥y∥^2 := sorry
  
/-- If $x$ is an element of infinite order in $G$, prove that the elements $x^n$, 
  $n\\in\\mathbb{Z}$ are all distinct. -/
theorem distinct_powers_of_infinite_order_element (G : Type*) [group G] (x : G)
  (hx : x ≠ 1) (hx_inf : ∀ n : ℕ, x ^ n ≠ 1) :
  ∀ m n : ℤ, m ≠ n → x ^ m ≠ x ^ n := sorry
  
/-- Let $X$ be a topological space; let $A$ be a subset of $X$. Suppose that for each $x\\in A$
  there is an open set $U$ containing $x$ such that $U\\subset A$. Show that $A$ is open in $X$. -/
theorem subset_of_open_subset_is_open (X : Type*) [topological_space X] 
  (A : set X) (hA : ∀ x ∈ A, ∃ U : set X, is_open U ∧ x ∈ U ∧ U ⊆ A) : 
  is_open A := sorry"

meta def prompt_of_nl_statement (nl few_shot_prompt : string):= 
few_shot_prompt ++ "\n\n/--" ++ nl ++ "-/\ntheorem"

meta def example_nl := "Let $a,b\\in G$, Show that $ab$ and $ba$ have the same order."

meta def example_prompt := prompt_of_nl_statement example_nl few_shot_prompt
