package pkgNebel;


public aspect TraceAspectNebel {
	pointcut classToTrace(): within(*App);

	   pointcut constructorToTrace(): classToTrace() && execution(new(..));

	   pointcut methodToTrace():  classToTrace() &&  execution(* getName(..));

	   before(): methodToTrace() {
	      System.out.println("[BGN] " + thisJoinPointStaticPart.getSignature() + //
	    		 ", " + thisJoinPointStaticPart.getSourceLocation().getLine());
	   }

	   after(): methodToTrace() {
	      System.out.println("[END] " + thisJoinPointStaticPart.getSourceLocation().getFileName());
	   }
}
