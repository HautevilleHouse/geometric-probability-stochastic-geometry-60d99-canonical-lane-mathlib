import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean

structure RandomVariableSequence (Ω : Type u) [MeasureTheory.MeasureSpace Ω] where
  sequence : ℕ → Ω → ℝ
  integrable : ∀ n, MeasureTheory.Integrable (sequence n)

def AlmostSureConvergence (X : RandomVariableSequence Ω) (X_inf : Ω → ℝ) : Prop :=
  ∀ ω, Filter.Tendsto (λ n : ℕ => X.sequence n ω) Filter.atTop (𝓝 (X_inf ω))

def ConvergenceInProbability (X : RandomVariableSequence Ω) (X_inf : Ω → ℝ) : Prop :=
  ∀ ε > 0, Filter.Tendsto (λ n : ℕ => MeasureTheory.volume {ω | |X.sequence n ω - X_inf ω| > ε}) Filter.atTop (𝓝 0)

def ConvergenceInDistribution (X : RandomVariableSequence Ω) (X_inf : Ω → ℝ) : Prop :=
  ∀ f : ℝ → ℝ, Continuous f → HasCompactSupport f →
    Filter.Tendsto (λ n : ℕ => ∫ ω, f (X.sequence n ω) ∂ MeasureTheory.volume) Filter.atTop (𝓝 (∫ ω, f (X_inf ω) ∂ MeasureTheory.volume))

structure LimitTheoremPackage where
  sequence : RandomVariableSequence Ω
  limitVariable : Ω → ℝ
  almostSureConvergence : AlmostSureConvergence sequence limitVariable
  convergenceInProbability : ConvergenceInProbability sequence limitVariable
  convergenceInDistribution : ConvergenceInDistribution sequence limitVariable

structure LimitTheoremEvidence (P : LimitTheoremPackage) where
  almostSureClosed : P.almostSureConvergence
  convergenceInProbabilityClosed : P.convergenceInProbability
  convergenceInDistributionClosed : P.convergenceInDistribution

def LimitTheoremClosed (P : LimitTheoremPackage) : Prop :=
  P.almostSureConvergence ∧ P.convergenceInProbability ∧ P.convergenceInDistribution

theorem limit_theorem_closed_from_evidence (P : LimitTheoremPackage) (E : LimitTheoremEvidence P) : LimitTheoremClosed P := by
  exact And.intro E.almostSureClosed (And.intro E.convergenceInProbabilityClosed E.convergenceInDistributionClosed)

end GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean
end HautevilleHouse