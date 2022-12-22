public class C2x4_LRLR_UD {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 2
        let interlockHeight = 4
        let stride = interlockWidth + interlockHeight
        var index = 0 //pointer to where we should put next set of words
        var shapeCount = 0
        var wordId: [UInt8] = []

        for phase in 0..<2 {
            if phase == 1 {
                wordId = Array(repeating: 0, count: stride * shapeCount)
            }

            for up1 in 0..<wordCount {

                if (W.Len[up1] >= interlockHeight) {
                    //print("up1:\(W.Start[up1])")

                    for left1 in 0..<wordCount {

                        if (W.Len[left1] >= interlockWidth &&
                            W.End[left1][1] == W.End[up1][3] &&
                            W.Id[left1] != W.Id[up1]) {
                            //print("left1:\(W.Start[left1])")

                            for down2 in 0..<wordCount {

                                if (W.Len[down2] >= interlockHeight &&
                                    W.Start[down2][0] == W.End[left1][0] &&
                                    W.Id[down2] != W.Id[left1] &&
                                    W.Id[down2] != W.Id[up1]) {
                                    //print("down2:\(W.Start[down2])")

                                    for right2 in 0..<wordCount {

                                        if (W.Len[right2] >= interlockWidth &&
                                            W.Start[right2][0] == W.End[up1][2] &&
                                            W.Start[right2][1] == W.Start[down2][1] &&
                                            W.Id[right2] != W.Id[down2] &&
                                            W.Id[right2] != W.Id[left1] &&
                                            W.Id[right2] != W.Id[up1]) {
                                            //print("right2:\(W.Start[right2])")

                                            for left3 in 0..<wordCount {

                                                if (W.Len[left3] >= interlockWidth &&
                                                    W.End[left3][1] == W.End[up1][1] &&
                                                    W.End[left3][0] == W.Start[down2][2] &&
                                                    W.Id[left3] != W.Id[right2] &&
                                                    W.Id[left3] != W.Id[down2] &&
                                                    W.Id[left3] != W.Id[left1] &&
                                                    W.Id[left3] != W.Id[up1]) {
                                                    //print("left3:\(W.Start[left3])")

                                                    for right4 in 0..<wordCount {

                                                        if (W.Len[right4] >= interlockWidth &&
                                                            W.Start[right4][0] == W.End[up1][0] &&
                                                            W.Start[right4][1] == W.Start[down2][3] &&
                                                            W.Id[right4] != W.Id[left3] &&
                                                            W.Id[right4] != W.Id[right2] &&
                                                            W.Id[right4] != W.Id[down2] &&
                                                            W.Id[right4] != W.Id[left1] &&
                                                            W.Id[right4] != W.Id[up1]) {
                                                            //print("right4:\(W.Start[right4])")

                                                            if phase == 0 {
                                                                shapeCount += 1
                                                            }
                                                            else {
                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [left1, right2, left3, right4, up1, down2])

}}}}}}}}}}}}}}
        return ClusterModel(
            wordId: wordId,
            outerStart: [],
            patternHorizontal: [.leading, .trailing, .leading, .trailing],
            patternVertical: [.leading, .trailing],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }

}
